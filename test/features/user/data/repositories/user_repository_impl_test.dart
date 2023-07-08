import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/user/data/datasources/user_remote_data_source.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/data/repositories/user_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../additional/json_reader/json_reader.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserRemoteDataSourceImpl])
void main() {
  late UserRepositoryImpl repository;
  late MockUserRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = MockUserRemoteDataSourceImpl();
    repository = UserRepositoryImpl(dataSource: dataSource);
  });

  group('signUp', () {
    final tExtendedUser = ExtendedUserModel.fromJson(
        (jsonDecode(jsonReader('user/extended_user.json'))));
    final tSignUpHelper = SignUpHelperModel(
        email: "test1@gmail.com",
        password: "test123",
        data: SignUpExtendedHelperModel(
            dateOfBirth: "test",
            firstName: "test",
            lastName: "test",
            phoneNumber: "test"));
    test(
      "should return a user when signUp is called from dataSource",
      () async {
        when(dataSource.signUp(any)).thenAnswer((_) async => tExtendedUser);
        final result = await repository.signUp(tSignUpHelper);
        verify(dataSource.signUp(any));
        expect(result, Right(tExtendedUser));
        verifyNoMoreInteractions(dataSource);
      },
    );
    test(
      "should return [Error Response] when getOneProduct is called unsuccessfully",
      () async {
        when(dataSource.signUp(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
                requestOptions: RequestOptions(), data: 'Error happened!')));
        final result = await repository.signUp(tSignUpHelper);
        verify(dataSource.signUp(any));
        expect(result, const Left(ResponseI(message: 'Error happened!')));
      },
    );
    test(
      "should return special [Error Response] message, when getOneProduct is called unsuccessfully (500 error)",
      () async {
        when(dataSource.signUp(any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response:
                Response(statusCode: 500, requestOptions: RequestOptions())));
        final result = await repository.signUp(tSignUpHelper);
        verify(dataSource.signUp(any));
        expect(result, left(const ResponseI(message: 'Xəta baş verdi!')));
      },
    );
  });
}

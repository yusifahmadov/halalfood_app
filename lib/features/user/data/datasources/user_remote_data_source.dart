import 'package:dio/dio.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';

import 'package:retrofit/retrofit.dart';
part 'user_remote_data_source.g.dart';

abstract class UserRemoteDataSource {
  Future<ExtendedUserModel> signUp(SignUpHelperModel body);
  Future<ExtendedUserModel> signIn(SignInHelperModel body);
}

@RestApi(baseUrl: "https://kvomucgmlrykalkgmztb.supabase.co/auth/v1/")
abstract class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  factory UserRemoteDataSourceImpl(Dio dio) = _UserRemoteDataSourceImpl;

  @override
  @POST("signup")
  Future<ExtendedUserModel> signUp(@Body() SignUpHelperModel body);

  @override
  @POST("token?grant_type=password")
  Future<ExtendedUserModel> signIn(@Body() SignInHelperModel body);
}

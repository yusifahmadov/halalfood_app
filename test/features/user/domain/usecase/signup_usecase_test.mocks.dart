// Mocks generated by Mockito 5.4.2 from annotations
// in halalfood/test/features/user/domain/usecase/signup_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes, must_be_immutable
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:halalfood/core/error/response.dart' as _i6;
import 'package:halalfood/features/user/data/models/user_model.dart' as _i3;
import 'package:halalfood/features/user/domain/entities/user_extended.dart'
    as _i7;
import 'package:halalfood/features/user/domain/repositories/user_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i4.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.ResponseI, _i7.ExtendedUser>> signUp(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [
            email,
            password,
          ],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.ResponseI, _i7.ExtendedUser>>.value(
                _FakeEither_0<_i6.ResponseI, _i7.ExtendedUser>(
          this,
          Invocation.method(
            #signUp,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.ResponseI, _i7.ExtendedUser>>);
}

/// A class which mocks [ExtendedUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockExtendedUser extends _i1.Mock implements _i7.ExtendedUser {
  MockExtendedUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get accessToken => (super.noSuchMethod(
        Invocation.getter(#accessToken),
        returnValue: '',
      ) as String);
  @override
  String get refreshToken => (super.noSuchMethod(
        Invocation.getter(#refreshToken),
        returnValue: '',
      ) as String);
  @override
  _i3.UserModel get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUserModel_1(
          this,
          Invocation.getter(#user),
        ),
      ) as _i3.UserModel);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}

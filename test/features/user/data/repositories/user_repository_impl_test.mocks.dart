// Mocks generated by Mockito 5.4.2 from annotations
// in halalfood/test/features/user/data/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:halalfood/features/user/data/datasources/user_remote_data_source.dart'
    as _i3;
import 'package:halalfood/features/user/data/models/extended_user_model.dart'
    as _i2;
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart'
    as _i5;
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

class _FakeExtendedUserModel_0 extends _i1.SmartFake
    implements _i2.ExtendedUserModel {
  _FakeExtendedUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRemoteDataSourceImpl extends _i1.Mock
    implements _i3.UserRemoteDataSourceImpl {
  MockUserRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ExtendedUserModel> signUp(_i5.SignUpHelperModel? body) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [body],
        ),
        returnValue:
            _i4.Future<_i2.ExtendedUserModel>.value(_FakeExtendedUserModel_0(
          this,
          Invocation.method(
            #signUp,
            [body],
          ),
        )),
      ) as _i4.Future<_i2.ExtendedUserModel>);
}

import 'package:dio/dio.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'user_remote_data_source.g.dart';

abstract class UserRemoteDataSource {
  Future<ExtendedUserModel> signUp(String email, String password);
}

@RestApi(baseUrl: "https://kvomucgmlrykalkgmztb.supabase.co/auth/v1/")
abstract class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  factory UserRemoteDataSourceImpl(Dio dio) = _UserRemoteDataSourceImpl;

  @override
  @POST("signup")
  Future<ExtendedUserModel> signUp(
      @Field("email") String email, @Field("password") String password);
}

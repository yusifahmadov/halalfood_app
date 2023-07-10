import 'package:dio/dio.dart';

import '../../features/user/data/models/extended_user_model.dart';
import '../shared_preferences/custom_shared_preferences.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await CustomSharedPreferences.readUser("userdata") != null) {
      options.headers["Authorization"] =
          "Bearer ${ExtendedUserModel.fromJson(await CustomSharedPreferences.readUser("userdata")).accessToken}";
    }

    options.headers['apikey'] =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt2b211Y2dtbHJ5a2Fsa2dtenRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg0ODU5NDcsImV4cCI6MjAwNDA2MTk0N30.rjDli0BFmDJ7PSmel6R8UWJGnZPDfMROf4YbtlR9lWM';

    handler.next(options);
  }
}

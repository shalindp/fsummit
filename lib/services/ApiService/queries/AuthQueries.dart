import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import '../ApiService.dart';

class AuthQueries {
  final ApiService _apiService;
  final ApiQuery _apiQuery;

  AuthQueries(this._apiService, this._apiQuery);

  Future<Response<AuthResponseResultResponse>> signInAsync(SignInRequestBody body) => _apiService.userApi.userSignInPost(signInRequestBody: body);

  Future<Response<AuthResponseResultResponse>> signUpAsync(SignUpRequestBody body) => _apiService.userApi.userSignUpPost(signUpRequestBody: body);

  Future<Response<void>> secureAsync(Object body) => _apiService.userApi.userSecureGet(headers: _apiService.headers);

  ApiQueryReturnType<AuthResponseResultResponse, SignInRequestBody> get signInQuery => _apiQuery.useApiQuery("sign-in", signInAsync, isAnonymous: true);

  ApiQueryReturnType<AuthResponseResultResponse, SignUpRequestBody> get useSignUp => _apiQuery.useApiQuery("sign-up", signUpAsync, isAnonymous: true);

  ApiQueryReturnType<void, Object> get secure => _apiQuery.useApiQuery("secure", secureAsync);
}

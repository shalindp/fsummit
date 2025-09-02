import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import '../ApiService.dart';

class AuthApiQueries {
  final ApiQueryReturnType<TData, TRequestBody> Function<TData, TRequestBody>(String cacheKey, ApiQueryInputMethod<TData, TRequestBody> inputMethod) _useApiQuery;
  final UserApi _userApi;

  AuthApiQueries(this._useApiQuery, this._userApi);

  Future<Response<AuthResponseResultResponse>> signInAsync(SignInRequestBody body) =>
      _userApi.userSignInPost(signInRequestBody: body);

  Future<Response<AuthResponseResultResponse>> signUpAsync(SignUpRequestBody body) =>
      _userApi.userSignUpPost(signUpRequestBody: body);

  ApiQueryReturnType<AuthResponseResultResponse, SignInRequestBody> get signInQuery => _useApiQuery("sign-in", signInAsync);
  ApiQueryReturnType<AuthResponseResultResponse, SignUpRequestBody> get useSignUp => _useApiQuery("sign-up", signUpAsync);
}

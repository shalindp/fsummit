import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import '../ApiService.dart';

class AuthApiQueries {
  final QueryBase _queryBase;
  final ApiService _apiService;
  final UserApi _userApi;

  AuthApiQueries(this._queryBase, this._apiService, this._userApi);

  Future<Response<AuthResponseResultResponse>> signInAsync(SignInRequestBody body) => _userApi.userSignInPost(signInRequestBody: body);

  Future<Response<AuthResponseResultResponse>> signUpAsync(SignUpRequestBody body) => _userApi.userSignUpPost(signUpRequestBody: body);

  Future<Response<void>> secureAsync(Object body) {
    print("@>>>> INSIDE ${_apiService.headers}");
    return _userApi.userSecureGet(headers: _apiService.headers);
  }

  ApiQueryReturnType<AuthResponseResultResponse, SignInRequestBody> get signInQuery => _queryBase.useApiQuery("sign-in", signInAsync, isAnonymous: true);

  ApiQueryReturnType<AuthResponseResultResponse, SignUpRequestBody> get useSignUp => _queryBase.useApiQuery("sign-up", signUpAsync, isAnonymous: true);

  ApiQueryReturnType<void, Object> get secure => _queryBase.useApiQuery("secure", secureAsync);
}

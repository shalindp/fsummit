import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

class ApiService {
  late final UserApi userApi;
  AuthResponse? authState;

  ApiService() {
    var openApi = Openapi(basePathOverride: "http://localhost:5253");
    userApi = openApi.getUserApi();
  }

  Future signInAsync() async {
    var body = SignInRequestBody((c) {
      c.email = "dylan@";
      c.password = "pswd";
    });

    try {
      var result = (await userApi.userSignInPost(signInRequestBody: body)).data!;
      if (result.isSuccessful) {
        authState = result.data;
      }
    } on DioException catch (e) {
      print("Sign in error @> ${e.response?.data}");
    }
  }

  // void silentRefreshAsync() async {
  //   if (_authState == null) {
  //     return;
  //   }
  //
  //   var isTokenExpired = JwtDecoder.isExpired(_authState!.token);
  //   if (isTokenExpired) {
  //     var body = SilentRefreshRequestBody((c) {
  //       c.id = _authState!.id;
  //       c.refreshToken = _authState!.refreshToken;
  //     });
  //
  //     var result = (await _userApi.userSilentRefreshPost(silentRefreshRequestBody: body)).data!;
  //     if (result.isSuccessful) {
  //       _authState = result.data;
  //     }
  //   }
  // }

  // void useApiQuery() async {
  //   var xx = ApiQueryService();
  //
  //   Future<Response<AuthResponseResultResponse>> ooos(SilentRefreshRequestBody body) => userApi.userSilentRefreshPost(silentRefreshRequestBody: body);
  //   var k = xx.useApiQuery<AuthResponseResultResponse, SilentRefreshRequestBody>("test", ooos);
  //
  //   var body = SilentRefreshRequestBody((c) {
  //     c.id = _authState!.id;
  //     c.refreshToken = _authState!.refreshToken;
  //   });
  //
  //   var l = await k(body);
  //   var oo = l;
  // }
}

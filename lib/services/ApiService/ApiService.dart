import 'package:dio/dio.dart';
import 'package:fsummit/services/ApiService/queries/AuthQuery.dart';
import 'package:openapi/openapi.dart';
import 'package:signals/signals_flutter.dart';

part 'Query.dart';

class ApiService {
  AuthResponse? _authState;

  late UserApi _userApi;
  late _QueryBase _queryBase;

  late AuthApiQueries auth;

  ApiService() {
    var openApi = Openapi(basePathOverride: "http://localhost:5253");
    _userApi = openApi.getUserApi();
    _queryBase = _QueryBase();

    auth = AuthApiQueries(_queryBase.useApiQuery, _userApi);
  }

  get authState => _authState;
  get authQuires => auth;
}

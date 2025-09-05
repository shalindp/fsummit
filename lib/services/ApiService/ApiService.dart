import 'package:dio/dio.dart';
import 'package:fsummit/services/ApiService/queries/AuthQueries.dart';
import 'package:openapi/openapi.dart';
import 'package:signals/signals_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import 'package:signalr_netcore/msgpack_hub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:logging/logging.dart';

part 'ApiQuery.dart';

part 'SignalR.dart';

class ApiService {
  AuthResponse? _authState;
  Map<String, dynamic> headers = {};
  Openapi? openApi;
  _SignalR? _signalR;

  UserApi get userApi => openApi!.getUserApi();
  late AuthQueries authQueries;

  ApiService() {
    openApi = Openapi(basePathOverride: "http://localhost:5253");
    var queryBase = ApiQuery(this);
    authQueries = AuthQueries(this, queryBase);
  }

  get authQuires => authQueries;

  set authState(AuthResponse? value) {
    _authState = value;

    headers = {"Authorization": "Bearer ${_authState!.token}"};

    if (_signalR == null) {
      _SignalR(_authState!);
    }
  }
}

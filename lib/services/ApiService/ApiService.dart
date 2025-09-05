import 'package:dio/dio.dart';
import 'package:fsummit/services/ApiService/queries/AuthQuery.dart';
import 'package:openapi/openapi.dart';
import 'package:signals/signals_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import 'package:signalr_netcore/msgpack_hub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:logging/logging.dart';

part 'Query.dart';

part 'SignalR.dart';

class ApiService {
  AuthResponse? _authState;
  late Map<String, dynamic> headers = {};

  late QueryBase _queryBase;
  _SignalR? _signalR;

  late AuthApiQueries authQueries;

  ApiService() {
    var openApi = Openapi(basePathOverride: "http://localhost:5253");
    _queryBase = QueryBase(openApi, this);

    authQueries = AuthApiQueries(_queryBase, this, openApi.getUserApi());
  }

  get authQuires => authQueries;

  set authState(AuthResponse? value) {
    _authState = value;

    headers = {"Authorization": "Bearer ${_authState!.token}"};

    if (_signalR == null) {
      _SignalR(_authState!);
    }
  }

  get authState => _authState;
}

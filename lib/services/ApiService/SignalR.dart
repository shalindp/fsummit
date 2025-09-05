part of 'ApiService.dart';

class WSUserConnection {
  final String AppUserId;

  WSUserConnection(this.AppUserId);
}

class _SignalR {
  final AuthResponse _authState;

  _SignalR(this._authState) {
    initSignalR();
  }

  Future<void> initSignalR() async {
    Logger.root.level = Level.OFF; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });

    final serverUrl = "http://localhost:5253/ws";
    print("init ws ${serverUrl}");

    final defaultHeaders = MessageHeaders();
    defaultHeaders.setHeaderValue("Authorization", "Bearer ${_authState.token}");

    // Creates the connection by using the HubConnectionBuilder.
    final hubConnection = HubConnectionBuilder()
        .withUrl(
          serverUrl,
          options: HttpConnectionOptions(headers: defaultHeaders, accessTokenFactory: () async => _authState.token),
        )
        .withHubProtocol(MessagePackHubProtocol())
        .withAutomaticReconnect()
        .configureLogging(Logger.root)
        .build();
    // When the connection is closed, print out a message to the console.

    hubConnection.onclose((({Exception? error}) {
      print("WS ERROR ${error.toString()}");
    }));

    hubConnection.on("InitialiseConnection", (arguments) {
      print("@>  message ${arguments.toString()}");
    });

    hubConnection.on("SystemReceived", (arguments) {
      print("@>  SystemReceivedmessage ${arguments.toString()}");
    });

    await hubConnection.start();

    String myUserId = "9f2d6b2f-9f94-4b7c-a08f-2c441d7cb1b4"; // example GUID
    var x = WSUserConnection(myUserId);

    var xx = {"AppUserId": myUserId};

    await hubConnection.invoke(
      "InitialiseConnection",
      args: [
        {"AppUserId": myUserId},
      ],
    );

    // await hubConnection.invoke("InitialiseConnection");
  }
}

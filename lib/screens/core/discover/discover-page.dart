import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openapi/openapi.dart';
import 'package:signals/signals_flutter.dart';

import '../../../services/ApiService/ApiService.dart';
import '../../../theme/theme.dart';

class DiscoverPage extends StatelessWidget {
  final _apiService = GetIt.I<ApiService>();

  late var signInQuery = _apiService.auth.signInQuery;

  // late ApiQueryReturnType<AuthResponseResultResponse, SilentRefreshRequestBody> x = _apiService.useQuery("Hello", _apiService.authState.silentRefreshAsync);

  DiscoverPage({super.key}) {}

  void onTap() async {
    var body = SignInRequestBody((c) {
      c.email = "dylan1@";
      c.password = "pswd";
    });

    var x = await signInQuery.fetchAsync(body);
    var k = x;
  }

  void onTap2() async {
    // print("@> WTF ${_apiService.authState?.refreshToken}");
    // var body = SilentRefreshRequestBody((c) {
    //   c.id = _apiService.authState!.id;
    //   c.refreshToken = _apiService.authState!.refreshToken;
    // });
    //
    // var result = await x.fetchAsync(body);
    // _apiService.authState = result!.data;
    // print(result!.data!.refreshToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text(signInQuery.errorMessageSignal.watch(context) ?? "No error"),
            Container(
              width: 100,
              height: 50,
              child: ElevatedButton(onPressed: onTap, child: Text("Call api")),
            ),
            Container(
              width: 100,
              height: 50,
              child: ElevatedButton(onPressed: onTap2, child: Text("Call refresh")),
            ),
          ],
        ),
      ),
    );
  }
}

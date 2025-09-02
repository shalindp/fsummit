import 'package:flutter/material.dart';
import 'package:fsummit/services/ApiQueryService.dart';
import 'package:fsummit/services/ApiService.dart';
import 'package:get_it/get_it.dart';
import 'package:openapi/openapi.dart';

import '../../../theme/theme.dart';

class DiscoverPage extends StatelessWidget {
  final _apiService = GetIt.I<ApiService>();
  final _apiQueryService = GetIt.I<ApiQueryService>();

  late ApiQueryReturnType<AuthResponseResultResponse, SilentRefreshRequestBody> x;

  DiscoverPage({super.key}) {
    x = _apiQueryService.useApiQuery("Hello", _apiQueryService.silentRefreshAsync);
  }

  void onTap() async {
    await _apiService.signInAsync();
  }

  void onTap2() async {
    print("@> WTF ${ _apiService.authState?.refreshToken}");
    var body = SilentRefreshRequestBody((c) {
      c.id = _apiService.authState!.id;
      c.refreshToken = _apiService.authState!.refreshToken;
    });

    var result = await x.fetchAsync(body);
    _apiService.authState = result!.data;
    print(result!.data!.refreshToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Container(width: 100, height: 50, child: ElevatedButton(onPressed: onTap, child: Text("Call api"))),
            Container(width: 100, height: 50, child: ElevatedButton(onPressed: onTap2, child: Text("Call refresh"))),
          ],
        ),
      ),
    );
  }
}

import 'package:fsummit/services/ApiQueryService.dart';
import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:fsummit/services/wsService.dart';
import 'package:get_it/get_it.dart';

import 'ApiService.dart';

final locator = GetIt.instance;

void registerDiContainer(){
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton<UiService>(UiService());
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerSingleton<ApiQueryService>(ApiQueryService());
  locator.registerSingleton<WsService>(WsService());
}
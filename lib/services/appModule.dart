import 'package:fsummit/services/navigationService.dart';
import 'package:fsummit/services/uiService.dart';
import 'package:get_it/get_it.dart';

import 'ApiService/ApiService.dart';

final locator = GetIt.instance;

void registerDiContainer(){
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton<UiService>(UiService());
  locator.registerSingleton<ApiService>(ApiService());
}
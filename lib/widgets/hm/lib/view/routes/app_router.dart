import 'package:flutter/material.dart';
import 'package:lec/view/screens/lec_completed_list.dart';
import 'package:lec/view/screens/lec_pending_list.dart';
import 'package:lec/view/screens/pend_comp.dart';

import '../app_data/app_strings.dart';
import '../screens/login.dart';
import '../screens/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  late Widget pageResult;
  switch (settings.name) {
    case AppStrings.routeToSplash:
      pageResult = const Splash();
      break;
    case AppStrings.routeToLogin:
      pageResult = const Login();
      break;
    case AppStrings.routeToPendComp:
      pageResult = const PendComp();
      break;
    case AppStrings.routeToLecPendingList:
      pageResult = const LecPendingList();
      break;
    case AppStrings.routeToLecCompletedList:
      pageResult = const LecCompletedList();
      break;
  }
  debugPrint(pageResult.toString());
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}

import 'package:flutter/material.dart';
import 'package:zrayo_flutter/config/helper.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  // You can implement your custom logic here, like logging or analytics
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    printLog('Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    printLog('Popped route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    printLog('Replaced route: ${newRoute?.settings.name}');
  }
}

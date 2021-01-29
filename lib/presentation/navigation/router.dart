import 'package:default_project/presentation/common/transitions/no_animation_transition.dart';
import 'package:default_project/presentation/home/home_page.dart';
import 'package:default_project/presentation/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

enum RouteType {
  push,
  pop,
}

enum AppRoute {
  splash_screen,
  home,
}

extension AppRouteExtension on AppRoute {
  String getRouteName() => this.toString();
}

abstract class AppRouter {
  static String initRoute() => AppRoute.splash_screen.getRouteName();

  static final Map<String, PageRoute Function(RouteSettings)> _routes = {
    AppRoute.splash_screen.getRouteName(): (settings) => NoAnimationPageRoute(
          builder: (context) => SplashScreenPage(),
        ),
    AppRoute.home.getRouteName(): (settings) => NoAnimationPageRoute(
          builder: (context) => HomePage(),
        ),
    //then use MaterialPageRoute
  };

  static void navigate({
    @required BuildContext context,
    @required AppRoute route,
    AppRoute parentRoute,
    @required RouteType type,
    Object arguments,
  }) {
    var routeId = route.getRouteName();
    switch (type) {
      case RouteType.push:
        Navigator.pushNamed(context, routeId, arguments: arguments);
        break;
      case RouteType.pop:
        Navigator.popUntil(context, ModalRoute.withName(routeId));
        break;
    }
  }

  static RouteFactory generateRoute() {
    return (settings) => _routes[settings.name](settings);
  }
}

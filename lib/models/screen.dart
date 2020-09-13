import 'package:flutter/cupertino.dart';

class Screen {
  final String title;
  final IconData iconData;
  final Widget child;
  final RouteFactory onGererateRoute;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorState;
  final ScrollController scrollController;

  Screen({
    @required this.title,
    @required this.iconData,
    @required this.child,
    @required this.onGererateRoute,
    @required this.initialRoute,
    @required this.navigatorState,
    this.scrollController,
  });
}

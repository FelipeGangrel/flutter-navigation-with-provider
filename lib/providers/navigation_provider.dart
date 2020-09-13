import 'package:flutter/material.dart';
import 'package:navigation/models/screen.dart';
import 'package:navigation/screens/home/home_screen.dart';
import 'package:navigation/screens/home/profile_screen.dart';
import 'package:navigation/screens/library/library_screen.dart';
import 'package:navigation/screens/search/search_screen.dart';

class ScreenIndex {
  static const HOME_SCREEN = 0;
  static const SEARCH_SCREEN = 1;
  static const LIBRARY_SCREEN = 2;
}

class NavigationProvider extends ChangeNotifier {
  int _currentTabIndex = ScreenIndex.HOME_SCREEN;
  int get currentTabIndex => _currentTabIndex;

  final Map<int, Screen> _screens = {
    ScreenIndex.HOME_SCREEN: Screen(
        title: 'Home',
        iconData: Icons.home,
        child: HomeScreen(),
        initialRoute: HomeScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        scrollController: ScrollController(),
        onGererateRoute: (settings) {
          switch (settings.name) {
            case ProfileScreen.route:
              return MaterialPageRoute(builder: (_) => ProfileScreen());
            default:
              return MaterialPageRoute(builder: (_) => HomeScreen());
          }
        }),
    ScreenIndex.SEARCH_SCREEN: Screen(
        title: 'Search',
        iconData: Icons.search,
        child: SearchScreen(),
        initialRoute: SearchScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        scrollController: ScrollController(),
        onGererateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => SearchScreen());
          }
        }),
    ScreenIndex.LIBRARY_SCREEN: Screen(
        title: 'My Library',
        iconData: Icons.search,
        child: LibraryScreen(),
        initialRoute: LibraryScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        scrollController: ScrollController(),
        onGererateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => LibraryScreen());
          }
        }),
  };
}

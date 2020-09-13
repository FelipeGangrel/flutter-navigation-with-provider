import 'package:flutter/material.dart';
import 'package:navigation/widgets/exit_dialog.dart';
import 'package:provider/provider.dart';

import 'package:navigation/models/screen.dart';
import 'package:navigation/screens/home/home_screen.dart';
import 'package:navigation/screens/home/profile_screen.dart';
import 'package:navigation/screens/library/library_screen.dart';
import 'package:navigation/screens/search/search_screen.dart';

class ScreenIndex {
  static const int HOME_SCREEN = 0;
  static const int SEARCH_SCREEN = 1;
  static const int LIBRARY_SCREEN = 2;
}

class NavigationProvider extends ChangeNotifier {
  /// Shortcut method for getting [NavigatorProvider]
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  // Route<dynamic> onGenerateRoute()

  int _currentScreenIndex = ScreenIndex.HOME_SCREEN;

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
      },
    ),
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
      },
    ),
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
      },
    ),
  };

  int get currentScreenIndex => _currentScreenIndex;
  List<Screen> get screens => _screens.values.toList();
  Screen get currentScreen => _screens[_currentScreenIndex];

  void setTab(int tabIndex) {
    if (tabIndex == currentScreenIndex) {
      _scrollToStart();
    } else {
      _currentScreenIndex = tabIndex;
      notifyListeners();
    }
  }

  /// If the current screen has scrollController, we are going
  /// animate it to the top
  void _scrollToStart() {
    if (currentScreen.scrollController != null) {
      currentScreen.scrollController.animateTo(0,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
    }
  }

  /// Provide this to [WillPopScope] callback
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentScreenIndex != ScreenIndex.HOME_SCREEN) {
        setTab(ScreenIndex.HOME_SCREEN);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => ExitAlertDialog(),
        );
      }
    }
  }
}

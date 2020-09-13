import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        final bottomNavigationBarItens = provider.screens.map((screen) {
          return BottomNavigationBarItem(
            title: Text(screen.title),
            icon: Icon(screen.iconData),
          );
        }).toList();

        final screens = provider.screens.map((screen) {
          return Navigator(
            key: screen.navigatorState,
            onGenerateRoute: screen.onGererateRoute,
          );
        }).toList();

        return WillPopScope(
          onWillPop: () => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              index: provider.currentScreenIndex,
              children: screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItens,
              currentIndex: provider.currentScreenIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: false,
                ).pushNamed(ProfileScreen.route);
              },
              child: Text('Go to profile with bottomNavigation'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(ProfileScreen.route);
              },
              child: Text('Go to profile without bottomNavigation'),
            ),
          ],
        ),
      ),
    );
  }
}

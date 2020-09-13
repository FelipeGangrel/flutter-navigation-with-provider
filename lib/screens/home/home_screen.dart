import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: Text('Go to profile with bottomNavigation'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Go to profile without bottomNavigation'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Text('My profile'),
      ),
    );
  }
}

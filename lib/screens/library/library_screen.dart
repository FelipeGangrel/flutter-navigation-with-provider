import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  static const String route = '/library';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Library'),
      ),
      body: Center(
        child: Text('My Library'),
      ),
    );
  }
}

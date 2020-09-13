import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String route = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}

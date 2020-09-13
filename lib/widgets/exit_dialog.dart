import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit?'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('Exit'),
        )
      ],
    );
  }
}

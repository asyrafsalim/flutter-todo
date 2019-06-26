import 'package:flutter/material.dart';

class TodoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Enter Todo'),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(),
        ),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                print('Add todo');
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('Add'),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoCard extends StatelessWidget {
  final bool completed;

  TodoCard({this.completed: false});

  @override
  Widget build(BuildContext context) {
    print(this.completed);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading:
                Icon(this.completed ? Icons.check_circle : Icons.assignment),
            title: Text(
              'Toto item...',
              style: TextStyle(
                  decoration:
                      this.completed ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              'Created Date: today',
              style: TextStyle(
                  decoration:
                      this.completed ? TextDecoration.lineThrough : null),
            ),
          ),
          this.completed
              ? Container()
              : ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Edit'),
                        onPressed: () {
                          print("edit");
                        },
                      ),
                      FlatButton(
                        child: Text('Mark As Complete'),
                        onPressed: () {
                          print("complete");
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

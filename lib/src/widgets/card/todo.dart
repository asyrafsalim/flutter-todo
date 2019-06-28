import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../bloc/models/todo.dart';

class TodoCard extends StatelessWidget {
  final bool completed;
  final TodoModel todo;

  TodoCard(this.todo, {this.completed: false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading:
                Icon(this.completed ? Icons.check_circle : Icons.assignment),
            title: Text(
              this.todo.task,
              style: TextStyle(
                  decoration:
                      this.completed ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              'Created Date: ${this.todo.date}',
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

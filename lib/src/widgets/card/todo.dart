import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../bloc/models/todo.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;

  TodoCard(this.todo);

  @override
  Widget build(BuildContext context) {
    bool completed = this.todo.completedDate.isNotEmpty ? true : false;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(completed ? Icons.check_circle : Icons.assignment),
            title: Text(
              this.todo.task,
              style: TextStyle(
                  decoration: completed ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              completed
                  ? 'Completed Date: ${this.todo.completedDate}'
                  : 'Created Date: ${this.todo.createdDate}',
              style: TextStyle(
                  decoration: completed ? TextDecoration.lineThrough : null),
            ),
          ),
          completed
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

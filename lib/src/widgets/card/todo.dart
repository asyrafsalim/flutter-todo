import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/models/todo.dart';
import '../../bloc/blocs/todo/bloc.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;

  TodoCard(this.todo);

  @override
  Widget build(BuildContext context) {
    bool completed = this.todo.completedDate.isNotEmpty ? true : false;
    final TodoBloc _todoBloc = BlocProvider.of<TodoBloc>(context);

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
                        disabledTextColor: Colors.grey,
                        onPressed: null,
                      ),
                      FlatButton(
                        child: Text('Mark As Complete'),
                        onPressed: () =>
                            _todoBloc.dispatch(CompleteTodo(this.todo)),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

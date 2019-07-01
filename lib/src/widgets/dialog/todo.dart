import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../bloc/models/todo.dart';
import '../../bloc/blocs/todo/bloc.dart';

class TodoDialog extends StatelessWidget {
  final textController = TextEditingController();
  final Uuid _uuid = new Uuid();

  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of<TodoBloc>(context);

    return SimpleDialog(
      title: const Text('Enter Todo'),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: textController,
          ),
        ),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                print('Add todo: ${textController.text}');
                TodoModel _todo = TodoModel(_uuid.v1(), textController.text,
                    DateTime.now().toString(), '');
                _todoBloc.dispatch(AddTodo(_todo));
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

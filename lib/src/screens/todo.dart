import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../bloc/models/todo.dart';
import '../bloc/blocs/todo/bloc.dart';
import '../widgets/dialog/todo.dart';
import '../widgets/card/todo.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoBloc _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.dispatch(LoadTodo());

    final Uuid _uuid = new Uuid();
    TodoModel _todo = TodoModel(_uuid.v1(), "test", 'date');

    _todoBloc.dispatch(AddTodo(_todo));
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            // to return list of cards
            Text(
              "Upcoming Todo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            BlocBuilder(
              bloc: _todoBloc,
              builder: (BuildContext context, TodoState state) {
                if (state is TodosLoaded) {
                  List<TodoModel> upcomingTodos = state.todos["upcoming"];

                  return Column(
                    children: upcomingTodos.map((TodoModel todo) {
                      return TodoCard(todo);
                    }).toList(),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                "Completed Todo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // TodoCard(
            //   completed: true,
            // ),
            // TodoCard(
            //   completed: true,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
              context: context,
              builder: (_) => TodoDialog(),
            ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

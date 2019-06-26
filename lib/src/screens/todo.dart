import 'package:flutter/material.dart';

import '../widgets/dialog/todo.dart';
import '../widgets/card/todo.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
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
            TodoCard(),
            TodoCard(),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                "Completed Todo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            TodoCard(
              completed: true,
            ),
            TodoCard(
              completed: true,
            ),
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

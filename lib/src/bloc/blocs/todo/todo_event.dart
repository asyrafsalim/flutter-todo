import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/todo.dart';

@immutable
abstract class TodoEvent extends Equatable {
  TodoEvent([List props = const []]) : super(props);
}

class LoadTodo extends TodoEvent {
  LoadTodo();

  @override
  String toString() => 'LoadTodos';
}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  AddTodo(this.todo) : super([todo]);

  @override
  String toString() => 'AddTodo';
}

class CompleteTodo extends TodoEvent {
  final TodoModel todo;

  CompleteTodo(this.todo) : super([todo]);

  @override
  String toString() => 'CompleteTodo';
}

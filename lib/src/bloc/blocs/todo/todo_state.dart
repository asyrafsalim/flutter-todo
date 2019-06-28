import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/todo.dart';

@immutable
abstract class TodoState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodosLoading extends TodoState {
  @override
  String toString() => 'TodosLoading';
}

class TodosLoaded extends TodoState {
  final Map<String, List<TodoModel>> todos;

  TodosLoaded([this.todos]) : super([todos]);

  @override
  String toString() => 'TodosLoaded { Todos: $todos }';
}

class TodosNotLoaded extends TodoState {
  @override
  String toString() => 'TodosNotLoaded';
}

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class TodoModel extends Equatable {
  final String id, task, date;

  TodoModel(
    this.id,
    this.task,
    this.date,
  ) : super([id, task, date]);
}

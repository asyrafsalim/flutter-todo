import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class TodoModel extends Equatable {
  final String id, task, createdDate, completedDate;

  TodoModel(this.id, this.task, this.createdDate, this.completedDate)
      : super([id, task, createdDate, completedDate]);
}

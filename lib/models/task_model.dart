import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final bool isComplete;

  const TaskModel(
      {required this.id, required this.title, required this.isComplete});

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isComplete,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, isComplete];
}





import 'package:chnangebetweenblocandcubit/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class TasksState extends Equatable{
  final List<TaskModel> tasksList;

  @override
  List<Object?> get props =>  [tasksList];
  const TasksState(this.tasksList);
}

final class TasksInitial extends TasksState {
   TasksInitial():super([]);


}
final class TasksUpdates extends TasksState {
  const TasksUpdates(super.tasksList);


}
import 'dart:async';

import 'package:chnangebetweenblocandcubit/bloc_task/task_event.dart';
import 'package:chnangebetweenblocandcubit/bloc_task/task_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TasksState> {
  TextEditingController controller = TextEditingController();

  TaskBloc() : super(TasksInitial()) {
    on<AddTaskEvent>(_addTask);
    on<RemoveTask>(_removeTask);
    on<CheckTask>(_checkTask);
    on<UpdateTask>(_updateTask);
    // on<AddTaskEvent>((event, emit) {
    //   final model = TaskModel(
    //     id: const Uuid().v4(),
    //     title: event.title,
    //     isComplete: true,
    //   );
    //   emit(TasksUpdates([...state.tasksList, model]));
    // });
    // on<RemoveTask>((event, emit) {
    //   List<TaskModel> newLists =
    //       state.tasksList.where((task) => task.id != event.id).toList();
    //   emit(TasksUpdates(newLists));
    // });
    // on<CheckTask>((event, emit) {
    //   List<TaskModel> newList = state.tasksList.map((task) {
    //     return task.id == event.id
    //         ? task.copyWith(isComplete: !task.isComplete)
    //         : task;
    //   }).toList();
    //   emit(TasksUpdates(newList));
    // });
    // on<UpdateTask>((event, emit) {
    //   List<TaskModel> newList = state.tasksList.map((task) {
    //     return task.id == event.id
    //         ? task.copyWith(title: controller.text)
    //         : task;
    //   }).toList();
    //   emit(TasksUpdates(newList));
    // });
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TasksState> emit) {
    final model = TaskModel(
      id: const Uuid().v4(),
      title: event.title,
      isComplete: true,
    );
    emit(TasksUpdates([...state.tasksList, model]));
  }

  FutureOr<void> _removeTask(RemoveTask event, Emitter<TasksState> emit) {
    List<TaskModel> newLists =
    state.tasksList.where((task) => task.id != event.id).toList();
    emit(TasksUpdates(newLists));
  }

  FutureOr<void> _checkTask(CheckTask event, Emitter<TasksState> emit) {
    List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == event.id
          ? task.copyWith(isComplete: !task.isComplete)
          : task;
    }).toList();
    emit(TasksUpdates(newList));
  }

  FutureOr<void> _updateTask(UpdateTask event, Emitter<TasksState> emit) {
    List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == event.id
          ? task.copyWith(title: controller.text)
          : task;
    }).toList();
    emit(TasksUpdates(newList));
  }
}

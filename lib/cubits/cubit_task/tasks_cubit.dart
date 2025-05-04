import 'package:chnangebetweenblocandcubit/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(const TasksInitial([]));
  TextEditingController controller = TextEditingController();

  // اشافة تاسك جديد
  addTask(String title) {
    final model = TaskModel(
      id: const Uuid().v4(),
      title: title,
      isComplete: true,
    );
    // هنا بفرط الليست عشان اضيفها في الليست التانيه الجديدة

    // emit(TasksUpdates(List.from(state.tasksList)..add(model)));

    emit(TasksUpdates([...state.tasksList, model]));
  }

  removeTask({required String id}) {
    List<TaskModel> newLists =
        state.tasksList.where((task) => task.id != id).toList();
    emit(TasksUpdates(newLists));
  }

  checkCompleteTask({required String id}) {
    List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == id ? task.copyWith(isComplete: !task.isComplete) : task;
    }).toList();
    emit(TasksUpdates(newList));
  }

  updateTask({required String id}) {
    List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == id ? task.copyWith(title: controller.text) : task;
    }).toList();
    emit(TasksUpdates(newList));
  }
}

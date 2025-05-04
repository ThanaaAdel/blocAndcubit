part of 'tasks_cubit.dart';

@immutable
sealed class TasksState extends Equatable{
  final List<TaskModel> tasksList;

  @override
  List<Object?> get props =>  [tasksList];
  const TasksState(this.tasksList);
}

final class TasksInitial extends TasksState {
  const TasksInitial(super.tasksList);


}
final class TasksUpdates extends TasksState {
  const TasksUpdates(super.tasksList);


}


sealed class TaskEvent {}
class AddTaskEvent extends TaskEvent{
  final String title ;

  AddTaskEvent(this.title);

}
class RemoveTask extends TaskEvent{
  final String id;

  RemoveTask(this.id);
}
class UpdateTask  extends TaskEvent{
  final String id;

  UpdateTask(this.id);
}
class CheckTask extends TaskEvent{
  final String id;

  CheckTask(this.id);
}

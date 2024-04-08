import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:microsoft_to_do/task.dart';

part 'task_cubit.freezed.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState.loaded([], []));
  List<Task> tasks = [];
  List<Task> deletedTasks = [];

  void addTask(Task task) {
    tasks.add(task);
    emit(TaskState.loaded(List.from(tasks), List.from(deletedTasks)));
  }

  void removeTask(Task task) {
    deletedTasks.add(task);
    tasks.remove(task);
    emit(TaskState.loaded(List.from(tasks), List.from(deletedTasks)));
  }

  void removeTaskFromCompleted(Task task) {
    deletedTasks.remove(task);
    tasks.add(task);
    emit(TaskState.loaded(List.from(tasks), List.from(deletedTasks)));
  }
}

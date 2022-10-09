import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';
import 'package:todo_bloc/models/task.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TodoState> emit) {
    final state = this.state;
    emit(TodoState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TodoState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTask = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTask.insert(
            index,
            task.copyWith(isDone: true),
          )
        : allTask.insert(index, task.copyWith(isDone: false));

    emit(TodoState(allTasks: allTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TodoState> emit) {
    final state = this.state;
    emit(TodoState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    // TODO: implement toJson
    return state.toMap();
  }
}

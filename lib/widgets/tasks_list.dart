import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/bloc/todo_bloc.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: tasksList.length,
      itemBuilder: (context, index) {
        var task = tasksList[index];
        return ListTile(
          title: Text(task.title),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              context.read<TodoBloc>().add(UpdateTask(task: task));
            },
          ),
          onLongPress: () =>
              context.read<TodoBloc>().add(DeleteTask(task: task)),
        );
      },
    ));
  }
}

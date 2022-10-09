part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<Task> allTasks;
  const TodoState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  // Map<String, dynamic> toMap() {
  //   return {
  //     'allTasks': allTasks.map((x) => x.toMap()).toList(),
  //   };
  // }
  //
  // factory TodoState.fromMap(Map<String, dynamic> map) {
  //   return TodoState(
  //     allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
  //   );
  // }

  // String toJson() => json.encode(toMap());
  // factory TodoState.fromJson(String source)=>TodoState.fromMap(json.decode(source));
}

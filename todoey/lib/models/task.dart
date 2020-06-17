class Task {
  final String name;
  bool isDone;
  Task({this.name, this.isDone = false});
  toggleDone() {
    isDone = !isDone;
  }
}

List<Task> tasks = [
  Task(name: "get milk"),
  Task(name: "get eggs"),
  Task(name: "get bread"),
];

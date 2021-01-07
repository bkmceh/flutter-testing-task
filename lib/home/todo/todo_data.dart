class TodoElement {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoElement(this.userId, this.id, this.title, this.completed);

  TodoElement.fromMappedJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? 2,
        id = json['id'] ?? 'FILE',
        title = json['title'] ?? 'username',
        completed = json['completed'];
}

class TodoList {
  List<TodoElement> todoList;

  TodoList.fromMappedJson(List<dynamic> json) {
    todoList = json.map((user) => TodoElement.fromMappedJson(user)).toList();
  }
}

class TodoStore {
  static List<TodoElement> todoData = List();
}

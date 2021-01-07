import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:testing_task/home/todo/todo_data.dart';
import 'package:testing_task/home/users/selected_users.dart';
import 'package:testing_task/home/users/users_data.dart';

class Users extends StatefulWidget {
  final String myKey;

  Users(this.myKey);

  @override
  _Users createState() => _Users();
}

class _Users extends State<Users> {
  final String url = 'https://jsonplaceholder.typicode.com/users/';
  final String todoUrl = 'https://jsonplaceholder.typicode.com/todos/';
  ScrollController scrollController;

  @override
  void initState() {
    parseUsersList().then((value) {
      setState(() {
        UserStore.userData = value;
      });
    });
    parseTodoList().then((value) {
      setState(() {
        TodoStore.todoData = value;
      });
    });
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (UserStore.userData.isEmpty || TodoStore.todoData.isEmpty)
          ? Center(
              child: Container(
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            ))
          : ListView.builder(
              key: PageStorageKey(widget.myKey),
              controller: scrollController,
              itemCount: UserStore.userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: Card(
                    color: SelectedUsers.userList.contains(index)
                        ? Colors.blue[200]
                        : Colors.grey[300],
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Container(
                          child: circleAvatarText(index),
                        ),
                      ),
                      title: Text("${UserStore.userData[index].name}"),
                      subtitle: Text("${UserStore.userData[index].email}"),
                      onTap: () {
                        setState(() {
                          if (SelectedUsers.userList.contains(index)) {
                            SelectedUsers.userList.remove(index);
                          } else {
                            SelectedUsers.userList.add(index);
                          }
                        });
                      },
                    ),
                  ),
                );
              }),
    );
  }

  Future<List<UsersElement>> parseUsersList() async {
    final data = await http.get(url);

    List<dynamic> decodeJson = jsonDecode(data.body);

    UsersElementList usersElementList =
        UsersElementList.fromMappedJson(decodeJson);

    return usersElementList.usersList;
  }

  Future<List<TodoElement>> parseTodoList() async {
    final data = await http.get(todoUrl);

    List<dynamic> decodeJson = jsonDecode(data.body);

    TodoList todoList = TodoList.fromMappedJson(decodeJson);

    return todoList.todoList;
  }
}

Text circleAvatarText(final int index) {
  final int space = UserStore.userData[index].name.indexOf(' ');
  final String str = UserStore.userData[index].name[0] +
      UserStore.userData[index].name[space + 1];
  return Text(str);
}

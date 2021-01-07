import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testing_task/home/todo/todo_data.dart';
import 'package:testing_task/home/users/users_data.dart';
import 'package:testing_task/home/users/users.dart';

class Todo extends StatefulWidget {
  final String myKey;

  Todo(this.myKey);

  @override
  _Todo createState() => _Todo();
}

class _Todo extends State<Todo> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          key: PageStorageKey(widget.myKey),
          controller: scrollController,
          itemCount: UserStore.userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Card(
                  color: Colors.grey[300],
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      child: Container(
                        child: circleAvatarText(index),
                      ),
                    ),
                    key: PageStorageKey(index),
                    title: Text("${UserStore.userData[index].name}"),
                    subtitle: Text("${UserStore.userData[index].email}"),
                    children: [
                      for (int i = index * 20; i < index * 20 + 20; i++)
                        Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: TodoStore.todoData[i].completed
                                      ? Colors.green[400]
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: ListTile(
                                  title: Text('${TodoStore.todoData[i].title}'),
                                  subtitle: TodoStore.todoData[i].completed
                                      ? Text('Done')
                                      : Text('Not done'),
                                ),
                              ),
                            ),
                            if (i != index * 20 + 19) Divider(), // for beauty
                          ],
                        ),
                    ],
                  ),
                ));
          }),
    );
  }
}

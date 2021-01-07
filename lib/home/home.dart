import 'package:flutter/material.dart';
import 'package:testing_task/home/todo/todo.dart';
import 'package:testing_task/home/users/users.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 56,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "USERS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "TODO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [Users("UserKey"), Todo("TODOKey")],
          )),
    );
  }
}

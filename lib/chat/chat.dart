import 'package:flutter/material.dart';
import 'package:testing_task/home/users/selected_users.dart';
import 'package:testing_task/home/users/users_data.dart';
import 'package:testing_task/home/users/users.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Список выбранных пользователей"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: SelectedUsers.userList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Card(
                color: Colors.grey[300],
                child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      child: circleAvatarText(index),
                    ),
                  ),
                  title: Text(UserStore.userData[index].name),
                  subtitle: Text(UserStore.userData[index].email),
                ),
              ),
            );
          }),
    );
  }
}

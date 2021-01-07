import 'package:flutter/material.dart';
import 'package:testing_task/chat/chat.dart';
import 'package:testing_task/home/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        "HOME",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    ),
    Tab(
      child: Text(
        "CHAT",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          // controller: _tabController,
          children: [
            Home(),
            Chat(),
            // Text('Second tab'),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: myTabs,
          labelColor: Colors.blue,
        ),
      ),
    );
  }
}

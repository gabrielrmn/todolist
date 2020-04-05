import 'package:flutter/material.dart';

import 'pages/todolist.homepage.dart';

void main() => runApp(ToDoList());

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoListHomePage(),
    );
  }
}

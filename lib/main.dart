import 'package:flutter/material.dart';
import 'package:mytasks/screens/addTask.dart';
import 'package:mytasks/screens/finishTask.dart';
import 'package:mytasks/screens/listTasks.dart';
// import 'package:mytasks/screens/listTasks.dart';
import 'package:mytasks/screens/login.dart';
import 'package:mytasks/screens/register.dart';
import 'package:mytasks/screens/updateTask.dart';
// import 'package:mytasks/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
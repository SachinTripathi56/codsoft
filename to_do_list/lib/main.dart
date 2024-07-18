import 'package:flutter/material.dart';

import 'package:to_do_list/screen/homescreen.dart';
import 'package:to_do_list/screen/welcome.dart';

void main() => runApp(const Todolist());

class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todolist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcome(),
    );
  }
}

import 'dart:async';

import 'package:disable_screenshots/disable_screenshots.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoList());
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  DisableScreenshots _plugin = DisableScreenshots();

  late StreamSubscription<void> _screenshotsSubscription;

  @override
  void initState() {
    super.initState();
    _screenshotsSubscription = _plugin.onScreenShots.listen((event) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Lista de Tarefas',
          ),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return const Center(
      child: SizedBox(
        height: 600,
        child: Text('Titulo'),
      ),
    );
  }
}

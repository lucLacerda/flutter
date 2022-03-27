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
    return Center(
      child: Container(
        height: 600,
        child: Container(
            child:
              Container(
                child: Text('Titulo'),
              ),
        ),
      ),
    );
  }
}

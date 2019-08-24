import 'package:flutter/material.dart';
import 'package:flutter_route/models/todo.dart';

class DetailScreen extends StatelessWidget {
  final Todo todo;
  const DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.descripton),
      ),
    );
  }
}

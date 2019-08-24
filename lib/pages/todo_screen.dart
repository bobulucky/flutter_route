import 'package:flutter/material.dart';
import 'package:flutter_route/models/todo.dart';
import 'package:flutter_route/pages/detail_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key key}) : super(key: key);
  static const routeName = 'todoScreen';
  
  @override
  Widget build(BuildContext context) {
    final List<Todo> todos = List.generate(
        20,
        (i) => Todo(
            'Todo $i', 'A description of what needs to be done for Todo $i'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(todo: todos[index])));
              },
            );
          },
        ),
      ),
    );
  }
}

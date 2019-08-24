import 'package:flutter/material.dart';

class PassArgumentScreen extends StatelessWidget {
  const PassArgumentScreen(
      {Key key, @required this.title, @required this.message})
      : super(key: key);
  static const routeName = 'passArguments';

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

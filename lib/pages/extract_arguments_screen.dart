import 'package:flutter/material.dart';
import 'package:flutter_route/models/screen_arguments.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

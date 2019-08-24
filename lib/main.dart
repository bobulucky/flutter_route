import 'package:flutter/material.dart';
import 'package:flutter_route/models/screen_arguments.dart';
import 'package:flutter_route/pages/extract_arguments_screen.dart';
import 'package:flutter_route/pages/home_page.dart';
import 'package:flutter_route/pages/navigate_second_route.dart';
import 'package:flutter_route/pages/pass_argument_screen.dart';
import 'package:flutter_route/pages/todo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/secondPage': (context) => NavigateSecondRoute(),
        TodoScreen.routeName: (context) => TodoScreen(),
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen()
      },
      onGenerateRoute: (settings) {
        MaterialPageRoute materialPageRoute;
        if (settings.name == PassArgumentScreen.routeName) {
          final ScreenArguments args = settings.arguments;

          materialPageRoute = MaterialPageRoute(builder: (context) {
            return PassArgumentScreen(title: args.title, message: args.message);
          });
        }
        return materialPageRoute;
      },
      // home: HomePage(),
    );
  }
}
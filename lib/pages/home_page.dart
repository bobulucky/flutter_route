import 'package:flutter/material.dart';
import 'package:flutter_route/models/screen_arguments.dart';
import 'package:flutter_route/pages/extract_arguments_screen.dart';
import 'package:flutter_route/pages/navigate_second_route.dart';
import 'package:flutter_route/pages/pass_argument_screen.dart';
import 'package:flutter_route/pages/selection_screen.dart';
import 'package:flutter_route/pages/todo_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter route home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigateSecondRoute()));
                },
                child: Text('Naviate to second route!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage');
                },
                child: Text('Navigate to second route with named!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExtractArgumentsScreen(),
                          settings: RouteSettings(
                              arguments: ScreenArguments(
                                  'Extract Arguments Screen',
                                  'This message is extracted in the build method!'))));
                },
                child: Text('Navigate to screen that extracts arguments!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PassArgumentScreen.routeName,
                      arguments: ScreenArguments('Accepts Arguments',
                          'This message is extracted in onGenerateRoute function!'));
                },
                child: Text('Naviagte to a named that accepts arguments!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectionButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TodoScreen.routeName);
                },
                child: Text('Go todo screen!'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

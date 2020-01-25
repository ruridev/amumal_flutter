import 'package:flutter/material.dart';
import 'package:amumal_app/screen/amumal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Amumal(),
    );
  }
}

import 'package:amumal_app/global/data.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/screen/amumal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data data = Data();

    return FutureBuilder(
      future: data.load(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          print('1');
          return MaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            home: Amumal(appData: snapshot.data),
          );
        } else if (snapshot.hasError) {
          print(snapshot);
          return MaterialApp(home: Text('has error'));
        }
        return MaterialApp(home: Text('loading...'));
      },
    );
  }
}

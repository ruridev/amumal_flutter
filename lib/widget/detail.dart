import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({this.time, this.text});

  String time;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(time),
          SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}

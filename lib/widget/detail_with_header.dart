import 'package:flutter/material.dart';
import 'detail.dart';

class DetailWithHeader extends StatelessWidget {
  DetailWithHeader({this.date, this.time, this.text});

  String date;
  String time;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
          Detail(time: time, text: text),
        ],
      ),
    );
  }
}

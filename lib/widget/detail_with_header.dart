import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:amumal_app/constrants.dart';

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
            child: Text(date, style: Constrants.cHeaderTextStyle),
          ),
          Detail(time: time, text: text),
        ],
      ),
    );
  }
}

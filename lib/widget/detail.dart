import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({this.time, this.text});

  String time;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 70.0,
            child: Text(time ?? '',
                style: TextStyle(
                  fontSize: 12.0,
                )),
          ),
          SizedBox(
            height: 12.0,
          ),
          Flexible(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

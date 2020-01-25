import 'package:flutter/material.dart';

class Amumal extends StatelessWidget {

  List list = new List();

  @override
  Widget build(BuildContext context) {
    list.add({'date': '2011-11-11'});
    list.add({'time': 'time', 'text': 'text'});
    list.add({'date': '2011-11-12'});
    list.add({'time': 'time', 'text': 'text'});

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(data: list[index]);
                  },
                  itemCount: list.length,
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.data});

  Map data;

  Widget build(BuildContext context) {
    return data.containsKey('date')
        ? DateHeader(date: data['date'])
        : Detail(time: data['time'], text: data['text']);
  }
}

class DateHeader extends StatelessWidget {
  DateHeader({this.date});

  String date;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(date));
  }
}

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
          Text(text),
        ],
      ),
    );
  }
}

String date;

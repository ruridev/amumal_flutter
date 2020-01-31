import 'package:flutter/material.dart';
import 'package:amumal_app/constrants.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail_with_header.dart';
import 'package:amumal_app/widget/detail.dart';

class AmumalList extends StatelessWidget {
  final listViewcontroller;
  final data;

  AmumalList({this.listViewcontroller, this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: listViewcontroller,
      itemBuilder: (BuildContext context, int index) {
        AmumalData amumal = AmumalData(mapData: data[index]);

        return (index == 0 || data[index - 1]['date'] != amumal.date)
            ? DetailWithHeader(
            date: amumal.date, time: amumal.time, text: amumal.text)
            : Detail(
            time:
            data[index - 1]['time'] != amumal.time ? amumal.time : null,
            text: amumal.text);
      },
      itemCount: data.length,
    );
  }
}

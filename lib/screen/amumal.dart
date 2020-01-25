import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';

class Amumal extends StatelessWidget {
  List list = new List();

  @override
  Widget build(BuildContext context) {
    list.add(AmumalData(date: '2011-11-11', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:34', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:35', text: 'text'));
    list.add(AmumalData(date: '2011-11-12', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:34', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:35', text: 'text'));
    list.add(AmumalData(date: '2011-11-12', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:34', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:35', text: 'text'));
    list.add(AmumalData(date: '2011-11-12', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:34', text: 'text'));
    list.add(AmumalData(date: '2011-11-11', time: '11:22:35', text: 'text'));
    list.add(AmumalData(date: '2011-11-12', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));
    list.add(AmumalData(date: '2011-11-13', time: '11:22:33', text: 'text'));

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return (index == 0 ||
                              list[index - 1].date != list[index].date)
                          ? DetailWithHeader(
                              date: list[index].date,
                              time: list[index].time,
                              text: list[index].text)
                          : Detail(
                              time: list[index].time, text: list[index].text);
                    },
                    itemCount: list.length,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    //Add th Hint text here.
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(location: 0),
      ),
    );
  }
}

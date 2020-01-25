import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';

class Amumal extends StatelessWidget {
  Amumal({this.appData});

  final Data appData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appData.list(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
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
                            AmumalData amumal =
                                AmumalData(mapData: snapshot.data[index]);

                            return (index == 0 ||
                                    snapshot.data[index - 1]['date'] !=
                                        amumal.date)
                                ? DetailWithHeader(
                                    date: amumal.date,
                                    time: amumal.time,
                                    text: amumal.text)
                                : Detail(time: amumal.time, text: amumal.text);
                          },
                          itemCount: snapshot.data.length,
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
              bottomNavigationBar: NavigationBar(location: 0, appData: appData),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('loading...');
        }
        return Text('loading...');
      },
    );
  }
}

import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';

class Amumal extends StatefulWidget {
  Amumal({this.appData});

  final Data appData;

  @override
  _AmumalState createState() => _AmumalState();
}

class _AmumalState extends State<Amumal> {
  @override
  initState() {
    super.initState();
  }

  @override
  int dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  final textFieldcontroller = TextEditingController();
  final listViewcontroller = ScrollController();
  final FocusNode textFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.appData.list(),
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
                          controller: listViewcontroller,
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
                                : Detail(time: snapshot.data[index - 1]['time'] !=
                                amumal.time ? amumal.time : null, text: amumal.text);
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
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              focusNode: textFieldFocus,
                              controller: textFieldcontroller,
                              decoration: InputDecoration(
                                //Add th Hint text here.
                                hintText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                              onSubmitted: (v) {
                                setState(() {
                                  widget.appData.add(cdate(), ctime(), v);
                                });
                                textFieldcontroller.clear();
                                FocusScope.of(context)
                                    .requestFocus(textFieldFocus);
                                listViewcontroller.animateTo(
                                  listViewcontroller.position.maxScrollExtent + 40,
                                  duration: new Duration(milliseconds: 200),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 24.0),
                          InkWell(
                            child: Icon(Icons.send),
                            onTap: () {
                              setState(() {
                                widget.appData.add(
                                    cdate(), ctime(), textFieldcontroller.text);
                              });
                              textFieldcontroller.clear();
                              FocusScope.of(context)
                                  .requestFocus(textFieldFocus);
                              listViewcontroller.animateTo(
                                listViewcontroller.position.maxScrollExtent + 40,
                                duration: new Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar:
                  NavigationBar(location: 0, appData: widget.appData),
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot);
          return Text('error...');
        }
        return Text('loading...');
      },
    );
  }

  String cdate() {
    var now = DateTime.now();
    return now.year.toString() +
        ". " +
        now.month.toString().padLeft(2, "0") +
        ". " +
        now.day.toString().padLeft(2, "0");
  }

  String ctime() {
    var now = DateTime.now();
    return now.hour.toString().padLeft(2, "0") +
        ":" +
        now.minute.toString().padLeft(2, "0") +
        ":" +
        now.second.toString().padLeft(2, "0");
  }
}

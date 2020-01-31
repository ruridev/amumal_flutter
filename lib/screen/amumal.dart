import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';
import 'package:amumal_app/widget/text_input_box.dart';
import 'package:amumal_app/widget/amumal_list.dart';
import 'package:amumal_app/constrants.dart';

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

  final listViewcontroller = ScrollController();

  void addAmumal(amumal) {
    setState(() {
      widget.appData.add(cdate(), ctime(), amumal);
    });

    listViewcontroller.animateTo(
      listViewcontroller.position.maxScrollExtent + 40,
      duration: new Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

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
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          padding: EdgeInsets.all(20.0),
                          child: AmumalList(
                            data: snapshot.data,
                            listViewcontroller: listViewcontroller,
                          ),
                        ),
                      ),
                    ),
                    TextInputBox(addAmumal: addAmumal)
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
        now.minute.toString().padLeft(2, "0"); // +
    // ":" +
    // now.second.toString().padLeft(2, "0");
  }
}


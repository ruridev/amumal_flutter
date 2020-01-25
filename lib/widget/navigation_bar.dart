import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/screen/amumal.dart';
import 'package:amumal_app/screen/chart.dart';
import 'package:amumal_app/screen/profile.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({this.location, this.appData});

  int location;
  Data appData;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: location,
      // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart),
          title: Text('Chart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
      onTap: (index) async {

        Widget next_screen;
        if (index == 0) {
          next_screen = Amumal(appData: appData);
        } else if (index == 1) {
          next_screen = Chart(appData: appData);
        } else if (index == 2) {
          next_screen = Profile(appData: appData);
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => next_screen,
          ),
        );
      },
    );
  }
}

import 'package:amumal_app/screen/amumal.dart';
import 'package:amumal_app/screen/profile.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({this.location});

  int location;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: location, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
      onTap: (index) {
        Widget new_location;

        switch (index) {
          case 0:
            new_location = Amumal();
            break;
          case 1:
            new_location = Profile();
            break;
        }
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new_location,
          ),
        );
      },
    );
  }
}

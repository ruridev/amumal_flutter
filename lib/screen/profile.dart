import 'package:amumal_app/global/data.dart';
import 'package:amumal_app/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:amumal_app/model/amumal_data.dart';
import 'package:amumal_app/widget/detail.dart';
import 'package:amumal_app/widget/detail_with_header.dart';

class Profile extends StatelessWidget {
  Profile({this.appData});

  final Data appData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('profile'),
        ),
        bottomNavigationBar: NavigationBar(location: 1, appData: appData),
      ),
    );
  }
}

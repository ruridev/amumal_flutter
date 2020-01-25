import 'package:amumal_app/screen/amumal.dart';

class AmumalData {
  AmumalData({this.date, this.time, this.text, mapData}) {
    if (mapData != null) {
      date = mapData['date'];
      time = mapData['time'];
      text = mapData['text'];
    }
  }

  String date;
  String time;
  String text;
}

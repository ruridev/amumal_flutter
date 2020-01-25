import 'package:amumal_app/global/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  List<Map> amumal;

  Future<Data> load() async {
    amumal = await Sqlite().list();

    return this;
  }

  void add(String date, String time, String text) async {
    await Sqlite().insert(date, time, text);
  }

  void deleteAll() async {
    await Sqlite().deleteAll();
  }
}

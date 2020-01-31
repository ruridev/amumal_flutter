import 'package:amumal_app/global/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  Sqlite sqlite;

  Future<Data> load() async {
    sqlite = await Sqlite().init();
    return this;
  }

  void open() async {
    await sqlite.open();
  }

  void close() {
    //sqlite.close();
  }

  Future<List<Map>> list() async {
    List<Map> result = await sqlite.list();
    close();
    return result;
  }

  Future<List<Map>> chart() async {
    await open();
    List<Map> result = await sqlite.chart();
    close();
    return result;
  }

  void add(String date, String time, String text) async {
    await open();
    await sqlite.insert(date, time, text);
    close();
  }

  void deleteAll() async {
    await open();
    await sqlite.deleteAll();
    close();
  }
}

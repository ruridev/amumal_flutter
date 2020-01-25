import 'package:amumal_app/global/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  Sqlite sqlite;

  Future<Data> load() async {
    return await this;
  }

  void open() async {
    sqlite = await Sqlite().open();
  }

  void close() {
    //sqlite.close();
  }

  Future<List<Map>> list() async {
    await open();
    List<Map> result = await sqlite.list();
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

import 'package:sqflite/sqflite.dart';

class Sqlite {
  Database db;

  void init() async {
    db = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Amumal (id INTEGER PRIMARY KEY, date TEXT, time TEXT, text TEXT)');
    });

    db.close();
  }

  Future<List<Map>> list() async {
    db = await openDatabase('my_db.db');

    List<Map> list = await db.query('Amumal');

    db.close();

    return list;
  }

  void delete(int id) async {
    List<Map> list;
    db = await openDatabase('my_db.db');

    await db.delete(
      'Amumal',
      where: "id = ?",
      whereArgs: [id],
    );

    db.close();
  }

  void deleteAll() async {
    List<Map> list;
    db = await openDatabase('my_db.db');

    await db.delete('Amumal');

    db.close();
  }

  Future<int> insert(date, time, text) async {
    db = await openDatabase('my_db.db');

    int id = await db.rawInsert(
        'INSERT INTO Amumal(date, time, text) VALUES(?, ?, ?)',
        [date, time, text]);

    db.close();

    return id;
  }
}

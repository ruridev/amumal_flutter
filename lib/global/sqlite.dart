import 'package:sqflite/sqflite.dart';

class Sqlite {
  Database db;

  Future<Sqlite> open() async {
    db = await openDatabase('my_db.db');
    return this;
  }

  void init() async {
    db = await openDatabase(
      'my_db.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Amumal (id INTEGER PRIMARY KEY, date TEXT, time TEXT, text TEXT)',
        );
      },
    );
  }

  Future<List<Map>> list() async {
    return await db.query('Amumal');
  }

  void delete(int id) {
    db.delete(
      'Amumal',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  void deleteAll() {
    db.delete('Amumal');
  }

  int insert(date, time, text) {
    int id;
    db.rawInsert('INSERT INTO Amumal(date, time, text) VALUES(?, ?, ?)',
        [date, time, text]).then((id) {
      id = id;
    });
    return id;
  }

  void close() {
    db.close();
  }
}

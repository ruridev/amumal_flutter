import 'package:sqflite/sqflite.dart';

class Sqlite {
  Database db;
  var databasesPath;

  Future<Sqlite> init() async {
    databasesPath = await getDatabasesPath() + '/' + 'my_db.db';
    print(databasesPath);
    db = await openDatabase(
      databasesPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Amumal (id INTEGER PRIMARY KEY, date TEXT, time TEXT, text TEXT)',
        );
      },
    );
    return this;
  }

  Future<Sqlite> open() async {
    db = await openDatabase(databasesPath);
    return this;
  }

  Future<List<Map>> list() async {
    return await db.query('Amumal');
  }

  Future<List<Map>> chart() async {
    return await db
        .rawQuery('select date, count(*) as cnt from Amumal group by date');
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
        [date, time, text]).then((id,) {
      id = id;
    });
    return id;
  }

  void close() {
    db.close();
  }
}

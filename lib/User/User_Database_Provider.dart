import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'UsersPropertis.dart';

class DatabaseHelper {
  static Database _database;

  String _UserTable = "u";
  String _columnID = "id";
  String _columnusername = "username";
  String _columntelno = "telno";
  String _columnadres="adres";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "users.db");
    var notesDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return notesDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table $_UserTable($_columnID integer primary key, $_columnusername text, $_columnadres text,$_columntelno text)");
  }

  //Crud Methods
  Future<List<User1>> getAllU() async {
    Database db = await this.database;
    var result = await db.query("$_UserTable");
    return List.generate(result.length, (i) {
      return User1.fromMap(result[i]);
    });
  }

  Future<int> insert(User1 user1) async {
    Database db = await this.database;
    var result = await db.insert("$_UserTable", user1.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete("delete from $_UserTable where id=$id");
    return result;
  }

  Future<int> update(User1 user1) async {
    Database db = await this.database;
    var result = await db.update("$_UserTable", user1.toMap(),
        where: "id=?", whereArgs: [user1.id]);
    return result;
  }
}
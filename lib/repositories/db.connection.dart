import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDb() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'dbEgtai-v1');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE settings(id INTEGER PRIMARY KEY, username TEXT, email TEXT, passwordSetOrRemove INTEGER, password TEXT, userId INTEGER, type TEXT, avatar TEXT, localToken TEXT, language TEXT, fontSize INTEGER, fontColor TEXT, backgroundColor TEXT, createdAt TEXT)");
  }
}

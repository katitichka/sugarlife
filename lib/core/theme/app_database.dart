import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), 'sugarlife.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user(
            id TEXT PRIMARY KEY,
            name TEXT,
            age INTEGER,
            gender TEXT
          )
        ''');
      },
    );

    return _db!;
  }
}

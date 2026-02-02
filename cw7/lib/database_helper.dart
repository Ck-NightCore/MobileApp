import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get database async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database db = await instance.database;
    return await db.query('users');
  }

  Future<int> updateUser(User user) async {
    Database db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllUsers() async {
    Database db = await instance.database;
    await db.delete('users');
  }

  Future<void> insertInitialUsers() async {
    List<User> usersToAdd = [
      User(username: 'john', email: 'john@example.com'),
      User(username: 'jane', email: 'jane@example.com'),
      User(username: 'alice', email: 'alice@example.com'),
      User(username: 'bob', email: 'bob@example.com'),
    ];

    for (User user in usersToAdd) {
      await insertUser(user);
    }
  }
}

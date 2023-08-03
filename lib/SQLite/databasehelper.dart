// Define your database and table structure
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableName = 'contacts';
const String columnId = 'id';
const String columnName = 'name';
const String columnPhone = 'phone';

class DatabaseHelper {
  // Singleton pattern to ensure only one instance of the database
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If the database does not exist, create it and initialize tables
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my_database.db');

    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnPhone TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertContact(Contact contact) async {
    Database db = await database;
    return await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((map) => Contact.fromMap(map)).toList();
  }

  Future<int> updateContact(Contact contact) async {
    Database db = await database;
    return await db.update(tableName, contact.toMap(),
        where: '$columnId = ?', whereArgs: [contact.id]);
  }

  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}

class Contact {
  int? id;
  String name;
  String phone;

  Contact({this.id, required this.name, required this.phone});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: name,
      columnPhone: phone,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map[columnId],
      name: map[columnName],
      phone: map[columnPhone],
    );
  }
}

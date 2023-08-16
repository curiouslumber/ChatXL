// Define your database and table structure
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableName = 'excelSheets';
const String columnId = 'id';
const String columnName = 'excelSheetName';
const String columnPhone = 'excelFilePath';

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

  Future<int> insertContact(ExcelSheets contact) async {
    Database db = await database;
    // ignore: avoid_print
    print("value inserted");
    return await db.insert(tableName, contact.toMap());
  }

  Future<List<Map<String, Object?>>> getContacts() async {
    Database db = await database;
    return await db.query('excelSheets');
  }

  Future<int> updateContact(ExcelSheets contact) async {
    Database db = await database;
    return await db.update(tableName, contact.toMap(),
        where: '$columnId = ?', whereArgs: [contact.id]);
  }

  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}

class ExcelSheets {
  int? id;
  String excelSheetName;
  String excelFilePath;

  ExcelSheets(
      {this.id, required this.excelSheetName, required this.excelFilePath});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: excelSheetName,
      columnPhone: excelFilePath,
    };
  }

  factory ExcelSheets.fromMap(Map<String, dynamic> map) {
    return ExcelSheets(
      id: map[columnId],
      excelSheetName: map[columnName],
      excelFilePath: map[columnPhone],
    );
  }
}

import 'package:chatdb/Database/SQLite/databasehelper.dart';
import 'package:flutter/material.dart';

class SQLiteTest extends StatefulWidget {
  const SQLiteTest({super.key});

  @override
  SQLiteTestState createState() => SQLiteTestState();
}

class SQLiteTestState extends State<SQLiteTest> {
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    // Initialize the database and create tables if necessary
    await dbHelper.database;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                await _addContact();
                await _readContacts();
              },
              child: const Text('Save and Read Data'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addContact() async {
    Contact newContact = Contact(name: 'John Doe', phone: '1234567890');
    await dbHelper.insertContact(newContact);
  }

  Future<void> _readContacts() async {
    List<Contact> contacts = await dbHelper.getContacts();
    for (var contact in contacts) {
      print('Contact: ${contact.name}, Phone: ${contact.phone}');
    }
  }
}

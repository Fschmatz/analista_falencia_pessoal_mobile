import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbCreator {

  static const _databaseName = "Analista.db";
  static const _databaseVersion = 1;
  static Database? _database;
  Future<Database> get database async =>
      _database ??= await initDatabase();

  DbCreator._privateConstructor();
  static final DbCreator instance = DbCreator._privateConstructor();

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {

    await db.execute('''    
           CREATE TABLE categories (
             idCategory INTEGER PRIMARY KEY,
             name TEXT NOT NULL,
             color TEXT NOT NULL             
          )          
          ''');

    await db.execute('''    
           CREATE TABLE expenses (
             idExpense INTEGER PRIMARY KEY,
             name TEXT NOT NULL,
             value REAL NOT NULL,
             date TEXT NOT NULL
          )          
          ''');


    await db.execute(''' 
          CREATE TABLE expenses_categories (
            idExpense INTEGER NOT NULL,
            idCategory INTEGER NOT NULL
          )
          ''');

    Batch batch = db.batch();

    batch.insert('expenses', {
      'idExpense': 1,
      'name': 'Korolev',
      'value': 351.66,
      'date': '25-01-1990'
    });

    batch.insert('expenses', {
      'idExpense': 2,
      'name': 'Zap',
      'value': 361.66,
      'date': '25-01-1992'
    });

    batch.insert('categories', {
      'idCategory': 1,
      'name': 'Zap',
      'color': 'green'
    });

    batch.insert('categories', {
      'idCategory': 2,
      'name': 'BOOM!',
      'color': 'red'
    });



    batch.insert('expenses_categories', {
      'idExpense': 1,
      'idCategory': 1
    });

    batch.insert('expenses_categories', {
      'idExpense': 2,
      'idCategory': 1
    });


    await batch.commit(noResult: true);

  }
}



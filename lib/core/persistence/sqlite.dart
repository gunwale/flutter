import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Sqlite {
  Sqlite._();
  static final Sqlite instance = Sqlite._();

  final String name = 'app.db';
  Database _database;

  Future<Database> get database async {
    return _database != null
        ? _database
        : await openDatabase(
            join((await getApplicationDocumentsDirectory()).path, name),
            version: 1,
            onOpen: (db) async {},
            onCreate: (Database db, int version) async {});
  }
}

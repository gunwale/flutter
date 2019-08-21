import 'package:demo/core/persistence/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Configuration {
  static final Future<Database> database = Sqlite.instance.database;
}

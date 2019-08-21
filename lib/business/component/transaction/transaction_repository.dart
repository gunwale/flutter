import 'package:demo/business/component/transaction/transaction_entity.dart';
import 'package:demo/config/configuration.dart';
import 'package:sqflite/sqflite.dart';

class TransactionRepository {
  static const String CREATE = "CREATE TABLE IF NOT EXISTS ";
  static const String TABLE = "Transactions";
  static const String WITH_FIELDS =
      "(id INTEGER PRIMARY KEY, name TEXT DEFAULT '')";

  final Database _database;

  TransactionRepository._(this._database);

  static final Future<TransactionRepository> _instance = ((database) async {
    await (await database).execute(CREATE + TABLE + WITH_FIELDS);
    return TransactionRepository._(await database);
  })(Configuration.database);

  static Future<TransactionRepository> get instance async {
    return await _instance;
  }

  Future<List<TransactionEntity>> findAll() async {
    final List<Map<String, dynamic>> maps = await _database.query(TABLE);

    return List.generate(maps.length, (i) {
      return TransactionEntity(id: maps[i]["id"], name: maps[i]["name"]);
    });
  }

  persist(TransactionEntity transactionEntity) async {
    return await _database.insert(TABLE, transactionEntity.toMap());
  }
}

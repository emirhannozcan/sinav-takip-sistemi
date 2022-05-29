import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/sinav.dart';

class DbHelper {
  static Database? _db;
  final String _sinavTablo = "exams";
  final String _id = "id";
  final String _sinavAd = "sinavAd";
  final String _matD = "matD";
  final String _matY = "matY";
  final String _matB = "matB";
  final String _turD = "turD";
  final String _turY = "turY";
  final String _turB = "turB";
  final String _fenD = "fenD";
  final String _fenY = "fenY";
  final String _fenB = "fenB";
  final String _sosD = "sosD";
  final String _sosY = "sosY";
  final String _sosB = "sosB";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    await db.execute(
        "Create table $_sinavTablo($_id integer primary key, $_sinavAd text, $_matD integer, $_matY integer, $_matB integer, $_turD integer, $_turY integer, $_turB integer, $_fenD integer, $_fenY integer, $_fenB integer, $_sosD integer, $_sosY integer, $_sosB integer)");
  }

  Future<List<Sinav>> getAllExams() async {
    Database? db = await this.db;
    var result = await db!.query("$_sinavTablo");
    return List.generate(result.length, (i) {
      return Sinav.fromMap(result[i]);
    });
  }

  Future<int> insert(Sinav sinav) async {
    Database? db = await this.db;
    var result = await db!.insert("$_sinavTablo", sinav.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database? db = await this.db;
    var result = await db!.rawDelete("delete from $_sinavTablo where id=$id");
    return result;
  }

  Future<int> update(Sinav sinav) async {
    Database? db = await this.db;
    var id = sinav.id;
    var result =
        await db!.update("$_sinavTablo", sinav.toMap(), where: "id=$id");
    return result;
  }
}

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_qrscanner/models/scan_model.dart';
export 'package:flutter_qrscanner/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
        ''');
      },
    );
  }

  //Manera larga de hacer el insert
  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, type, value)
        VALUES( $id, '$type', '$value')
      ''');

    return res;
  }

  //Manera corta de hacer el insert
  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromMap(scan)).toList()
        : null;
  }

  Future<List<ScanModel>?> getScansByType(String type) async {
    final db = await database;
    final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE type = '$type'
    ''');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromMap(scan)).toList()
        : null;
  }
}

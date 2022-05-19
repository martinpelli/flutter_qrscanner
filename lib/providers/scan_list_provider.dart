import 'package:flutter/material.dart';

import 'package:flutter_qrscanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    if (typeSelected == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();

    if (scans != null) {
      this.scans = [...scans];
    } else {
      this.scans = [];
    }
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    if (scans != null) {
      this.scans = [...scans];
    } else {
      this.scans = [];
    }
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(typeSelected);
  }
}

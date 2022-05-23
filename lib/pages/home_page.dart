import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/scan_list_provider.dart';
import 'package:flutter_qrscanner/providers/db_provider.dart';
import 'package:flutter_qrscanner/providers/ui_provider.dart';

import 'package:flutter_qrscanner/pages/maps_page.dart';
import 'directions_page.dart';

import 'package:flutter_qrscanner/views/directions_view.dart';
import 'package:flutter_qrscanner/views/maps_view.dart';

import 'package:flutter_qrscanner/widgets/custom_navigationbar.dart';
import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        actions: [
          IconButton(
              onPressed: () {
                scanListProvider.deleteAllScans();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final tempScan = ScanModel(value: 'http://bitfried.com');

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapsPage();

      case 1:
        scanListProvider.loadScansByType('http');
        return DirectionsPage();

      default:
        return MapsView();
    }
  }
}

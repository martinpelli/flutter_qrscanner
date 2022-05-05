import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/providers/ui_provider.dart';
import 'package:flutter_qrscanner/views/directions_view.dart';
import 'package:flutter_qrscanner/views/maps_view.dart';
import 'package:flutter_qrscanner/widgets/custom_navigationbar.dart';
import 'package:provider/provider.dart';

import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
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

    switch (currentIndex) {
      case 0:
        return MapsView();

      case 1:
        return DirectionsView();

      default:
        return MapsView();
    }
  }
}

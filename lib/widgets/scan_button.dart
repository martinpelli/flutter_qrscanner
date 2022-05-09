import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    '#008080', 'Cancel', false, ScanMode.QR);
        final barcodeScanRes = 'http';
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

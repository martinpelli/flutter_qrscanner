import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrscanner/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    '#008080', 'Cancel', false, ScanMode.QR);
        final barcodeScanRes = 'http';

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.newScan(barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

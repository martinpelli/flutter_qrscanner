import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrscanner/providers/scan_list_provider.dart';
import 'package:flutter_qrscanner/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#008080', 'Cancel', false, ScanMode.QR);

        //final barcodeScanRes = 'http';
        //final barcodeScanRes = 'geo:45,-75';

        if (barcodeScanRes == '-1') return;

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, newScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}

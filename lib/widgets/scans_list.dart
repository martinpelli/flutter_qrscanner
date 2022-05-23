import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/utils/utils.dart';

import 'package:provider/provider.dart';
import '../providers/scan_list_provider.dart';

class ScansList extends StatelessWidget {
  final String type;

  const ScansList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) {
          final scan = scanListProvider.scans[i];
          return Dismissible(
            background: Container(color: Colors.red),
            onDismissed: ((direction) =>
                scanListProvider.deleteScanById(scan.id!)),
            key: Key(scan.id.toString()),
            child: ListTile(
              leading: Icon(type == 'http' ? Icons.link : Icons.map,
                  color: Theme.of(context).primaryColor),
              title: Text(scan.value),
              subtitle: Text('ID: ${scan.id}'),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => launchURL(context, scan),
            ),
          );
        });
  }
}

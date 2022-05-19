import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/scan_list_provider.dart';

class ScansList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) {
          final scan = scanListProvider.scans[i];
          return ListTile(
            leading: Icon(Icons.link, color: Theme.of(context).primaryColor),
            title: Text(scan.value),
            subtitle: Text('ID: ${scan.id}'),
            trailing:
                const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => print('asd'),
          );
        });
  }
}

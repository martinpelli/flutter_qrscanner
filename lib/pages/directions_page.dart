import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/scan_list_provider.dart';
import '../widgets/scans_list.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScansList();
  }
}

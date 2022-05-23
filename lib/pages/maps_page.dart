import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/widgets/scans_list.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScansList(type: 'geo');
  }
}

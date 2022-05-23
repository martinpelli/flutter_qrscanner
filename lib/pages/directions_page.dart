import 'package:flutter/material.dart';

import '../widgets/scans_list.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScansList(
      type: 'http',
    );
  }
}

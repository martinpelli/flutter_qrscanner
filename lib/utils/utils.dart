import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scanModel) async {
  final url = Uri.parse(scanModel.value);
  if (scanModel.type == 'http') {
    if (await canLaunchUrl(url)) {
      await launchURL(context, scanModel);
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scanModel);
  }
}

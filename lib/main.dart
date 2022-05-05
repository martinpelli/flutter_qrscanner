import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/pages/home_page.dart';
import 'package:flutter_qrscanner/pages/map_page.dart';
import 'package:flutter_qrscanner/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'map': (_) => MapPage()},
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    );
  }
}

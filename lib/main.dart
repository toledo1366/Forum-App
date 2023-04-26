import 'package:flutter/material.dart';
import 'package:forum_app/locator.dart';

void main() {
  _initCore();
  runApp(const MyApp());
}

void _initCore() {
  configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: null,
    );
  }
}
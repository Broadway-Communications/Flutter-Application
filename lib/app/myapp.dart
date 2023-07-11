import 'package:flutter/material.dart';
import 'package:unicorn/app/views/hompage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Unicorn';

  @override
// Using Homepage widget here instead of MyHomePage widget directly
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomePage(),
    );
  }
}
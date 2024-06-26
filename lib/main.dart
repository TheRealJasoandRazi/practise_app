import 'package:flutter/material.dart';
import 'package:practise_app/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: Homepage()
    );
  }
}

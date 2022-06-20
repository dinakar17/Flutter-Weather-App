// Below import lets us use the classes that are defined in that dart file
import 'package:climate_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';

// Note: If a class is immutable, it is usually a good idea to make its constructor a const constructor.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // Entry point in our flutter app..
      home: const LoadingScreen(),
    );
  }
}
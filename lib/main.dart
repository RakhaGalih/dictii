import 'package:dictii/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const KamusApp());

class KamusApp extends StatelessWidget {
  const KamusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue),
      title: 'Kamus App',
      home: const DictionaryScreen(),
    );
  }
}

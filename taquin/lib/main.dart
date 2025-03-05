import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart'; // Importez votre fichier homepage.dart
import 'page_state.dart'; // Importez la classe PageState

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PageState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMSE TP2 - Taquin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AMSE TP2 - Taquin'),
    );
  }
}
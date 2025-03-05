import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taquin/pages/Taquin.dart';
import 'page_state.dart'; // Importez la classe PageState

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context); // Accédez à l'état

    Widget page = TaquinPage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Row(children: [Expanded(child: page)]),
    );
  }
}

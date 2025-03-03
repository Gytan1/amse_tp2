import 'package:exercices/pages/exercice5c.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page_state.dart'; // Importez la classe PageState
import 'pages/exercice1.dart';
import 'pages/exercice2.dart';
import 'pages/exercice4.dart';
import 'pages/exercice5.dart';
import 'pages/exercice5b.dart';
import 'pages/menu.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context); // Accédez à l'état

    Widget page;
    switch (pageState.selectedIndex) {
      case 0:
        page = MenuPage();
        break;
      case 1:
        page = Exercice1Page();
        break;
      case 2:
        page = Exercice2Page();
        break;
      case 3:
        page = Exercice4Page();
        break;
      case 4:
        page = Exercice5Page();
        break;
      case 5:
        page = Exercie5bPage();
        break;
      case 6:
        page = Exercie5cPage();
        break;
      default:
        page = MenuPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Row(children: [Expanded(child: page)]),
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/exercice1.dart';
import 'pages/exercice2.dart';
import 'pages/exercice4.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Exercice1Page();
        break;
      case 1 : 
        page = Exercice2Page();
        break;
      case 2 : 
        page = Exercice4Page();
        break;

      default:
        page = Exercice1Page();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: page,  // Utilisation de la page Exercice1 pour afficher l'image
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'Exercice 1'),
          BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'Exercice 2'),
          BottomNavigationBarItem(icon: Icon(Icons.sos), label: 'Exercice 4'),

      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      }),
    );
  }
}

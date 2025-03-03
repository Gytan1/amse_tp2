import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart'; // Importez la classe PageState

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(
      context,
      listen: false,
    ); // Accédez à l'état

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 1"),
                onTap: () {
                  pageState.setIndex(
                    1,
                  ); // Met à jour l'index pour afficher Exercice1Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 2"),
                onTap: () {
                  pageState.setIndex(
                    2,
                  ); // Met à jour l'index pour afficher Exercice2Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 4"),
                onTap: () {
                  pageState.setIndex(
                    3,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 5"),
                onTap: () {
                  pageState.setIndex(
                    4,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 5b"),
                onTap: () {
                  pageState.setIndex(
                    5,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 5c"),
                onTap: () {
                  pageState.setIndex(
                    6,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 6 (base)"),
                onTap: () {
                  pageState.setIndex(
                    7,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_right_sharp),
                title: const Text("Exercice 6"),
                onTap: () {
                  pageState.setIndex(
                    8,
                  ); // Met à jour l'index pour afficher Exercice4Page
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

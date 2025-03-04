import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercices/page_state.dart';
import 'package:exercices/widgets/TileGrid.dart';

class Exercice6Page extends StatefulWidget {
  const Exercice6Page({super.key});

  @override
  State<Exercice6Page> createState() => _Exercice6PageState();
}

class _Exercice6PageState extends State<Exercice6Page> {
  int gridSize = 4;

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false); // Accédez à l'état

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => pageState.setIndex(0), // Retour au menu
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TileGrid(gridSize: gridSize), // Utilisation du TileGrid StatefulWidget
            ),
          ),
        );
      },
    );
  }
}

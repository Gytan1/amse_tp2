import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercices/page_state.dart';
import 'package:exercices/widgets/TileGrid.dart';

class Exercice7Page extends StatefulWidget {
  const Exercice7Page({super.key});

  @override
  State<Exercice7Page> createState() => _Exercice7PageState();
}

class _Exercice7PageState extends State<Exercice7Page> {
  int gridSize = 4;
  bool gameLaunched = false;

  // GlobalKey pour référencer l'état de TileGrid
  final GlobalKey<TileGridState> tileGridKey = GlobalKey<TileGridState>();

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);
    tileGridKey.currentState?.preview(gridSize);

    void _addGridSize() {
      setState(() {
        gridSize++;
      });
    }

    void _susGridSize() {
      setState(() {
        gridSize--;
      });
    }

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
              child: TileGrid(
                key: tileGridKey, // Attribuer la clé au TileGrid
                gridSize: gridSize,
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: _addGridSize,
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: _susGridSize,
                  child: const Text("-"),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addGridSize,
            child: const Text("START"),
          ),
        );
      },
    );
  }
}

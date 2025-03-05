import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';
import '../widgets/tile.dart';

class Exercie5bPage extends StatelessWidget {
  const Exercie5bPage({super.key});

  final int gridSize = 3;

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);
  

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
              child: GridView.count(
                crossAxisCount: gridSize,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // Génération des widgets via la nouvelle méthode
                children: Tile.tilesWidgetList('assets/images/meme.png', gridSize),
              ),
            ),
          ),
        );
      },
    );
  }
}

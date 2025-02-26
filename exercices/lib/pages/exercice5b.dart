import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';
import '../widgets/tile.dart';

class Exercie5bPage extends StatelessWidget {
  const Exercie5bPage({super.key});

  final int gridSize = 3;
  final String imagePath = 'assets/images/test.jpg';

  List<Tile> generateTiles() {
    List<Tile> tiles = [];
    double factor = 1 / gridSize;
    double step = 2.0 / (gridSize - 1);

    for (int y = 0; y < gridSize; y++) {
      for (int x = 0; x < gridSize; x++) {
        if (x == gridSize - 1 && y == gridSize - 1) continue; // Case vide
        tiles.add(
          Tile(
            imageURL: imagePath,
            alignment: Alignment(-1 + x * step, -1 + y * step),
          ),
        );
      }
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);
    List<Tile> tiles = generateTiles();

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
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: List.generate(gridSize * gridSize, (index) {
                  if (index == tiles.length) {
                    return Container(color: Colors.grey); // Case vide
                  }
                  return tiles[index].croppedImageTile();
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

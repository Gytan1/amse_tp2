import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  int xIndex;
  int yIndex;
  int gridSize;

  Tile({
    required this.imageURL,
    required this.xIndex,
    required this.yIndex,
    required this.gridSize,
  });

  /// Cette méthode retourne le widget affichant la portion découpée
  /// de l'image correspondant à cette tile.
  Widget croppedImageTile() {
    // Calcul de l'alignement pour positionner la portion de l'image.
    // Les alignements vont de -1 (début) à 1 (fin).
    double alignX = gridSize > 1 ? -1 + (2 * xIndex) / (gridSize - 1) : 0;
    double alignY = gridSize > 1 ? -1 + (2 * yIndex) / (gridSize - 1) : 0;

    return Container(
      height: 50,
      width: 50,
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Align(
            alignment: Alignment(alignX, alignY),
            widthFactor: 1 / gridSize, // Largeur de la portion
            heightFactor: 1 / gridSize, // Hauteur de la portion
            child: Image.asset(imageURL),
          ),
        ),
      ),
    );
  }

  /// Génère la liste des tiles en parcourant les index de 0 à gridSize - 1.
  static List<Tile> generateTiles(String path, int gridSize) {
    List<Tile> tiles = [];
    for (int y = 0; y < gridSize; y++) {
      for (int x = 0; x < gridSize; x++) {
        tiles.add(Tile(
          imageURL: path,
          xIndex: x,
          yIndex: y,
          gridSize: gridSize,
        ));
      }
    }
    return tiles;
  }

  /// Convertit une liste de Tile en une liste de Widget.
  static List<Widget> generateTileWidgets(List<Tile> tiles) {
    return tiles.map((tile) => tile.croppedImageTile()).toList();
  }

  /// Méthode utilitaire qui génère directement la liste des widgets pour la grille.
  static List<Widget> tilesWidgetList(String path, int gridSize) {
    List<Tile> tiles = generateTiles(path, gridSize);
    return generateTileWidgets(tiles);
  }
}

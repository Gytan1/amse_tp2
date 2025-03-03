import 'package:exercices/widgets/TileWidget.dart';
import 'package:flutter/material.dart';

class TileGrid {
  List<TileWidget> tiles;
  int size;

  TileGrid(gridSize) : tiles = [], size = gridSize;

  void generate(int size) {
    tiles = [];
    int index = 0;

    for(int x = 0; x < size; x++) {
      for(int y = 0; y < size; y++) {
        TileWidget tile = TileWidget();

        if(index == 0){
          tile.model.isEmpty = true;
        }

        tile.model.index = index;

        tiles.add(tile);

        index++;
      }
    }

    update();
  }

  void update() {
    int empty_idx = 0;

    // Trouver l'index de la tuile vide
    for(int i = 0; i < size * size; i++) {
      if(tiles[i].model.isEmpty) {
        empty_idx = i;
      }

      // Désactiver le mouvement pour toutes les tuiles
      tiles[i].model.canMove = false;
    }

    // Vérifier les cases adjacentes avant d'assigner canMove
    if (empty_idx - size >= 0) {  // Case supérieure
      tiles[empty_idx - size].model.canMove = true;
    }
    if (empty_idx + size < size * size) {  // Case inférieure
      tiles[empty_idx + size].model.canMove = true;
    }
    if (empty_idx % size != 0) {  // Case à gauche
      tiles[empty_idx - 1].model.canMove = true;
    }
    if (empty_idx % size != size - 1) {  // Case à droite
      tiles[empty_idx + 1].model.canMove = true;
    }
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for(TileWidget tile in tiles) {
      widgets.add(tile.coloredBox());
    }
    return widgets;
  }

}
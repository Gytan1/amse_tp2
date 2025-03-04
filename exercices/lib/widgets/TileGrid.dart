import 'package:exercices/widgets/TileWidget.dart';
import 'package:exercices/widgets/TileModel.dart';
import 'package:flutter/material.dart';

class TileGrid extends StatefulWidget {
  final int gridSize;

  const TileGrid({Key? key, required this.gridSize}) : super(key: key);

  @override
  _TileGridState createState() => _TileGridState();
}

class _TileGridState extends State<TileGrid> {
  late List<TileWidget> tiles;
  late int size;

  @override
  void initState() {
    super.initState();
    size = widget.gridSize;
    tiles = [];
    generate(size);
  }

  void generate(int size) {
    tiles = [];
    int index = 0;

    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        TileWidget tile = TileWidget(
          model: TileModel(),
          onTileTap: (TileWidget tile) {
            handleTileClick(tile);
          },
        );

        if (index == 0) {
          tile.model.isEmpty = true;
        }

        tile.model.index = index;

        tiles.add(tile);

        index++;
      }
    }
    shuffle();
    update();
  }

  void update() {
    int emptyIdx = findEmptyIndex();

    for (int i = 0; i < size * size; i++) {
      tiles[i].model.canMove = false;
    }

    if (emptyIdx - size >= 0) {
      tiles[emptyIdx - size].model.canMove = true; // Case supérieure
    }
    if (emptyIdx + size < size * size) {
      tiles[emptyIdx + size].model.canMove = true; // Case inférieure
    }
    if (emptyIdx % size != 0) {
      tiles[emptyIdx - 1].model.canMove = true; // Case à gauche
    }
    if (emptyIdx % size != size - 1) {
      tiles[emptyIdx + 1].model.canMove = true; // Case à droite
    }
    updateGrid();
  }

  void updateGrid() {
    for (TileWidget tile in tiles) {
      tile.model.updateTile();
    }
  }

  void shuffle() {
    setState(() {
      tiles.shuffle();
      update();
    });
  }

  int findEmptyIndex() {
    int emptyIdx = 0;

    for (int i = 0; i < size * size; i++) {
      if (tiles[i].model.isEmpty) {
        emptyIdx = i;
      }
    }
    return emptyIdx;
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for (TileWidget tile in tiles) {
      widgets.add(tile.coloredBox());
    }
    return widgets;
  }

  GridView getGrid() {
    return GridView.count(
      crossAxisCount: size,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: getWidgets(),
    );
  }

  void handleTileClick(TileWidget tile) {
    if (tile.model.canMove) {
      int emptyIdx = findEmptyIndex();
      setState(() {
        swap(tiles, tiles.indexOf(tile), emptyIdx);
        update();
      });
    }
  }

  void swap(List<dynamic> list, int index1, int index2) {
    var temp = list[index1];
    list[index1] = list[index2];
    list[index2] = temp;
  }

  @override
  Widget build(BuildContext context) {
    return getGrid();
  }
}

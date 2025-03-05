import 'package:taquin/widgets/TileWidget.dart';
import 'package:taquin/widgets/TileModel.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TileGrid extends StatefulWidget {
  final int gridSize;
  final bool isPreview;
  final String imageURL;
  final VoidCallback? onMove;
  final VoidCallback? onWin;

  const TileGrid({
    Key? key,
    required this.gridSize,
    this.isPreview = false,
    required this.imageURL,
    this.onMove,
    this.onWin,
  }) : super(key: key);

  @override
  _TileGridState createState() => _TileGridState();
}

class _TileGridState extends State<TileGrid> {
  late List<TileWidget> tiles;
  late int size;

  @override
  void initState() {
    super.initState();
    _initialize(widget.gridSize);
  }

  @override
  void didUpdateWidget(TileGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gridSize != widget.gridSize ||
        oldWidget.isPreview != widget.isPreview ||
        oldWidget.imageURL != widget.imageURL) {
      _initialize(widget.gridSize);
    }
  }

  void _initialize(int newSize) {
    size = newSize;
    tiles = _generateTiles();
    if (!widget.isPreview) _shuffle();
    _update();
  }

  List<TileWidget> _generateTiles() {
    final List<TileWidget> newTiles = [];
    final gridSize = widget.gridSize; // Utilisation de la taille dynamique

    for (int i = 0; i < gridSize * gridSize; i++) {
      final model = TileModel()
        ..isEmpty = (i == gridSize * gridSize - 1)
        ..index = i;

      newTiles.add(
        TileWidget(
          model: model,
          onTileTap: _handleTileTap,
          imageURL: widget.imageURL,
          xIndex: i % gridSize,
          yIndex: i ~/ gridSize,
          gridSize: gridSize,
        ),
      );
    }
    return newTiles;
  }

  void _shuffle() {
    const int numberOfShuffleMoves = 1000; // Nombre de mouvements de mélange
    int emptyIndex = _findEmptyIndex();

    for (int i = 0; i < numberOfShuffleMoves; i++) {
      final possibleMoves = _getValidMoveIndices(emptyIndex);
      if (possibleMoves.isEmpty) continue;

      // Sélection aléatoire d'un mouvement valide
      final randomMove = possibleMoves[math.Random().nextInt(possibleMoves.length)];
      
      // Échange des tuiles
      final temp = tiles[emptyIndex];
      tiles[emptyIndex] = tiles[randomMove];
      tiles[randomMove] = temp;

      // Mise à jour de la position de la case vide
      emptyIndex = randomMove;
    }

    setState(_update);
  }

  List<int> _getValidMoveIndices(int emptyIndex) {
    final List<int> validMoves = [];
    final int row = emptyIndex ~/ size;
    final int col = emptyIndex % size;

    // Vérification des mouvements possibles
    if (row > 0) validMoves.add(emptyIndex - size); // Haut
    if (row < size - 1) validMoves.add(emptyIndex + size); // Bas
    if (col > 0) validMoves.add(emptyIndex - 1); // Gauche
    if (col < size - 1) validMoves.add(emptyIndex + 1); // Droite

    return validMoves;
  }

  void _update() {
    final emptyIndex = _findEmptyIndex();
    
    for (final tile in tiles) {
      tile.model.canMove = false;
    }

    if (!widget.isPreview) {
      final adjacentIndices = [
        emptyIndex - size, // Haut
        emptyIndex + size, // Bas
        if (emptyIndex % size != 0) emptyIndex - 1, // Gauche
        if (emptyIndex % size != size - 1) emptyIndex + 1, // Droite
      ];

      for (final index in adjacentIndices) {
        if (index != null && index >= 0 && index < tiles.length) {
          tiles[index].model.canMove = true;
        }
      }
    }

    for (final tile in tiles) {
      tile.model.updateTile();
    }
  }

  int _findEmptyIndex() {
    return tiles.indexWhere((tile) => tile.model.isEmpty);
  }

  void _handleTileTap(TileWidget tile) {
    if (widget.isPreview) return;

    final emptyIndex = _findEmptyIndex();
    final tileIndex = tiles.indexOf(tile);

    if (tile.model.canMove) {
      setState(() {
        final temp = tiles[emptyIndex];
        tiles[emptyIndex] = tile;
        tiles[tileIndex] = temp;
        _update();
      });
      widget.onMove?.call();

      // Vérifier la victoire après le mouvement
      if (_checkVictory()) {
        widget.onWin?.call();
      }
    }
  }

  bool _checkVictory() {
    for (int i = 0; i < tiles.length; i++) {
      final tile = tiles[i];
      
      if (i == tiles.length - 1) {
        if (!tile.model.isEmpty) return false;
      } else {
        if (tile.model.index != i || tile.model.isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: size,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: tiles.map((tile) => tile.buildWidget()).toList(),
    );
  }
}

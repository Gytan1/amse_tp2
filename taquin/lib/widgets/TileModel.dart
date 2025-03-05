import 'package:flutter/material.dart';

class TileModel extends ChangeNotifier {
  Color color = Colors.grey;
  Color borderColor = Colors.transparent;
  bool canMove = false;
  bool isEmpty = false;
  int index = 0;

  Color getColor() {
    if (isEmpty) return Colors.white;
    return canMove ? Colors.grey[700]! : Colors.grey;
  }

  Color getBorderColor() {
    return canMove ? Colors.red : Colors.transparent;
  }

  void updateTile() {
    notifyListeners();
  }
}
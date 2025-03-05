import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class TileModel extends ChangeNotifier{
  Color color;
  Color borderColor;
  bool canMove;
  bool isEmpty;
  int index;

  //TileModel(this.color, this.borderColor, this.canMove, this.isEmpty, this.index);

  TileModel()
    : color = Color.fromARGB(0, 0, 0, 0),
      borderColor = Color.fromARGB(0, 0, 0, 0),
      canMove = false,
      isEmpty = false,
      index = 0;

  Color getColor() {
    if(isEmpty){
      color =  Color.fromARGB(255, 255, 255, 255);  // Tile blanche, pas de bordure
    }
    else if(canMove){
      color = Color.fromARGB(255, 90, 90, 90);      // Tile grise, bordure rouge
    }
    else{
      color = Color.fromARGB(255, 90, 90, 90);      // Tile grise, pas de bordure
    }
    return color;
  }

  Color getBorderColor() {
    if(isEmpty){
      borderColor =  Color.fromARGB(0, 255, 0, 0);  // Tile blanche, pas de bordure
    }
    else if(canMove){
      borderColor =  Color.fromARGB(255, 255, 0, 0);  // Tile grise, bordure rouge
    }
    else{
      borderColor =  Color.fromARGB(0, 255, 0, 0);  // Tile grise, pas de bordure
    }
    return borderColor;
  }

  void updateTile() {
    color = getColor();
    borderColor = getBorderColor();
    notifyListeners();
  }
}

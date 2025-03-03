import 'package:flutter/material.dart';
import 'TileModel.dart';

class TileWidget extends StatelessWidget {
  final TileModel model;

  TileWidget({super.key}) : model = TileModel();

  @override
  Widget build(BuildContext context) {
    return coloredBox();
  }

  Widget coloredBox() {
  return Container(
    decoration: BoxDecoration(
      color: model.getColor(),
      border: Border.all(
        color: model.getBorderColor(), // Couleur de la bordure
        width: 3, // Épaisseur de la bordure
      ),
    ),
    child: Center(
      child: Text(
        '${model.index}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
  );
}

}
import '../widgets/tile.dart';
import 'package:flutter/material.dart';

class Exercice4Page extends StatelessWidget {
  const Exercice4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tile tile = Tile(
        imageURL: "assets/images/test.jpg", alignment: Alignment.center);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: tile.croppedImageTile()
        );
      },
    );
  }
}

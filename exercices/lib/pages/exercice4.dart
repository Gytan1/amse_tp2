import '../widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';

class Exercice4Page extends StatelessWidget {
  const Exercice4Page({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);
    
    Tile tile = Tile(
        imageURL: "assets/images/test.jpg", alignment: Alignment.center);

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
            child: tile.croppedImageTile()
          ),
        );
      },
    );
  }
}

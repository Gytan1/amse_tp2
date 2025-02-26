import '../widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';

Widget createTileWidgetFrom(Tile tile) {
  return InkWell(
    child: tile.croppedImageTile(),
    onTap: () {
      print("tapped on tile");
    },
  );
}

class Exercice4Page extends StatelessWidget {
  const Exercice4Page({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);

    Tile tile = Tile(
      imageURL: "assets/images/test.jpg",
      alignment: Alignment.center,
    );

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
            child: Column(
              children: [
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: createTileWidgetFrom(tile),
                  ),
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/test.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

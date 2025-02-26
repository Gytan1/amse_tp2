import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.asset(imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile = Tile(
  imageURL: 'assets/images/test.jpg',
  alignment: Alignment(0, 0),
);

class DisplayTileWidget extends StatelessWidget {
  const DisplayTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
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
            SizedBox(
              height: 200,
              child: Image.asset('assets/images/test.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}

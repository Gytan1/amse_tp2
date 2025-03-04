import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TileModel.dart';

class TileWidget extends StatelessWidget {
  TileModel model;
  final Function(TileWidget) onTileTap;

  TileWidget({super.key, required this.model, required this.onTileTap});

  @override
  Widget build(BuildContext context) {
    model = Provider.of<TileModel>(context);
    return coloredBox();
  }

  Widget coloredBox() {
  return GestureDetector(
      onTap: () {
        onTileTap(this); // Appeler le callback au clic
      },
      child: Container(
        decoration: BoxDecoration(
          color: model.getColor(),
          border: Border.all(
            color: model.getBorderColor(),
            width: 3,
          ),
        ),
        child: Center(
          child: Text(
            '${model.index}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}
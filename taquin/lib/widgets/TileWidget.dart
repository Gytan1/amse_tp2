import 'package:flutter/material.dart';
import 'TileModel.dart';

class TileWidget {
  final TileModel model;
  final Function(TileWidget) onTileTap;
  String imageURL;
  int xIndex;
  int yIndex;
  int gridSize;

  TileWidget({
    required this.model,
    required this.onTileTap,
    required this.imageURL,
    required this.xIndex,
    required this.yIndex,
    required this.gridSize
  });

  Widget buildWidget() {
    return _TileWidgetContent(
      model: model,
      onTap: () => onTileTap(this),
      imageURL: imageURL,
      xIndex: xIndex,
      yIndex: yIndex,
      gridSize: gridSize
    );
  }
}

class _TileWidgetContent extends StatefulWidget {
  final TileModel model;
  final VoidCallback onTap;
  final String imageURL;
  final int xIndex;
  final int yIndex;
  final int gridSize;


  const _TileWidgetContent({
    required this.model,
    required this.onTap, 
    required this.imageURL, 
    required this.xIndex,
    required this.yIndex,
    required this.gridSize
  });

  @override
  State<_TileWidgetContent> createState() => _TileWidgetContentState();
}

class _TileWidgetContentState extends State<_TileWidgetContent> {
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_update);
  }

  @override
  void dispose() {
    widget.model.removeListener(_update);
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    double alignX = widget.gridSize > 1 ? -1 + (2 * widget.xIndex) / (widget.gridSize - 1) : 0;
    double alignY = widget.gridSize > 1 ? -1 + (2 * widget.yIndex) / (widget.gridSize - 1) : 0;

    if(widget.model.isEmpty) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 50,
          width: 50,
          color: Colors.white,
        ),
      );
    } else {
      return GestureDetector(
      onTap: widget.onTap,
      child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.model.getBorderColor(),
            width: 3,
          ),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Align(
            alignment: Alignment(alignX, alignY),
            widthFactor: 1 / widget.gridSize, // Largeur de la portion
            heightFactor: 1 / widget.gridSize, // Hauteur de la portion
            child: Image.asset(widget.imageURL),
          ),
        ),
      ),
    )
    );
    }
  }
}
import 'package:flutter/material.dart';

class Exercice1Page extends StatelessWidget {
  const Exercice1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Image.asset(
            'assets/images/test.jpg',
            width: constraints.maxWidth,    // Prend la largeur de l'écran
            height: constraints.maxHeight,  // Prend la hauteur de l'écran
            fit: BoxFit.contain,            // Garde les proportions de l'image
          ),
        );
      },
    );
  }
}

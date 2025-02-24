import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
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
      ),
    );
  }
}

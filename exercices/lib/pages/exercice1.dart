import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';

class Exercice1Page extends StatelessWidget {
  const Exercice1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false); // Accédez à l'état

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
            child: Image.asset(
              'assets/images/test.jpg',
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';

class Exercice5Page extends StatelessWidget {
  const Exercice5Page({super.key});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context, listen: false);

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
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            )
          ),
        );
      }
    );
  }
}

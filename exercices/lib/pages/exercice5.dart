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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

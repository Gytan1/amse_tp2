import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';
import '../widgets/tile.dart';

class Exercie5cPage extends StatefulWidget {
  const Exercie5cPage({super.key});

  @override
  State<Exercie5cPage> createState() => _Exercie5cPageState();
}

class _Exercie5cPageState extends State<Exercie5cPage> {
  int gridSize = 3;

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
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: gridSize,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // Génération des widgets via la nouvelle méthode
                    children: Tile.tilesWidgetList('assets/images/meme.png', gridSize),
                  ),
                ),
              ),
              Slider(
                value: gridSize.toDouble(),
                onChanged: (newSize) => setState(() => gridSize = newSize.toInt()),
                divisions: 10,
                min: 1,
                max: 10,
                label: "$gridSize",
              )
            ],
          ),
        );
      },
    );
  }
}

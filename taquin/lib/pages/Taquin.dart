import 'package:flutter/material.dart';
import 'package:taquin/widgets/TileGrid.dart';
import 'dart:math';

Random random = Random();

class TaquinPage extends StatefulWidget {
  const TaquinPage({super.key});

  @override
  State<TaquinPage> createState() => _TaquinPageState();
}

class _TaquinPageState extends State<TaquinPage> {
  int gridSize = 3;
  bool isPlaying = false;
  int moveCount = 0; // Compteur de coups
  String currentImage = ''; // Stockage de l'image actuelle

  List<String> images = [
    'assets/images/meme.png',
    'assets/images/meme2.jpg',
    'assets/images/meme3.jpg',
    'assets/images/meme4.jpg',
    'assets/images/meme5.jpg'
  ];

  @override
  void initState() {
    super.initState();
    // Initialisation de l'image aléatoire au démarrage
    currentImage = images[random.nextInt(images.length)];
  }

  void _incrementGridSize() {
    if (gridSize < 8) {
      setState(() {
        gridSize++;
        isPlaying = false;
        moveCount = 0; // Réinitialisation lors du changement de taille
      });
    }
  }

  void _decrementGridSize() {
    if (gridSize > 2) {
      setState(() {
        gridSize--;
        isPlaying = false;
        moveCount = 0;
      });
    }
  }

  void _startGame() {
    setState(() {
      isPlaying = true;
      moveCount = 0; // Réinitialiser le compteur au démarrage
    });
  }

  void _resetGame() {
    setState(() {
      isPlaying = false; // Retour en mode prévisualisation
      gridSize = 3; // Réinitialisation de la taille par défaut
      moveCount = 0; // Réinitialisation du compteur
      currentImage = images[random.nextInt(images.length)]; // Réinitialiser l'image
    });
  }

  // Fonction pour changer l'image aléatoirement
  void _changeImage() {
    setState(() {
      currentImage = images[random.nextInt(images.length)];
    });
  }

  void _incrementMoveCount() {
    setState(() {
      moveCount++;
    });
  }

  void _showVictoryDialog() {
    setState(() {
      isPlaying = false; // Désactive le jeu
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Victoire !'),
          content: Text('Résolu en $moveCount coups 🎉'),
          actions: [
            TextButton(
              child: const Text('Recommencer'),
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
                _changeImage();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Lignes de commandes
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: !isPlaying ? _decrementGridSize : null,
                ),
                Text('Taille: $gridSize', style: const TextStyle(fontSize: 20)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: !isPlaying ? _incrementGridSize : null,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(8.0),
            child: Row(children: [
              ElevatedButton(
                  onPressed: !isPlaying ? _startGame : null,
                  child: const Text('START'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: !isPlaying ? _changeImage : null, // Nouveau bouton pour changer l'image
                  child: const Text('CHANGE IMAGE'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetGame,
                  child: const Text('RESET'),
                ),
            ],)
          ),
          // Affichage du compteur de coups
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Coups: $moveCount',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          // Zone de jeu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TileGrid(
                gridSize: gridSize,
                isPreview: !isPlaying,
                imageURL: currentImage,
                onMove: _incrementMoveCount,
                onWin: _showVictoryDialog,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

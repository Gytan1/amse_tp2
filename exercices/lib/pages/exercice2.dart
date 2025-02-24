import 'dart:async'; // Pour utiliser Timer
import 'dart:math'; // Pour utiliser la fonction sin()

import 'package:flutter/material.dart';

class Exercice2Page extends StatefulWidget {
  const Exercice2Page({Key? key}) : super(key: key);

  @override
  _Exercice2PageState createState() => _Exercice2PageState();
}

class _Exercice2PageState extends State<Exercice2Page> {
  double rotateX = 0;
  double rotateY = 0;
  bool mirror = false;
  double scale = 1;

  late Timer _timer; // Déclare le timer
  bool _isAutomated = false; // Indique si l'automatisation est active

  // Initialisation des fréquences pour chaque paramètre
  final double freqRotateX = 0.5; // Fréquence de rotation en X
  final double freqRotateY = 0.3; // Fréquence de rotation en Y
  final double freqScale = 0.2;   // Fréquence d'échelle
  final double freqMirror = 0.5;  // Fréquence du miroir (flip)

  @override
  void initState() {
    super.initState();
    // Initialisation du timer sans démarrer automatiquement
  }

  // Fonction pour démarrer ou arrêter le timer
  void _toggleAutomation() {
    setState(() {
      _isAutomated = !_isAutomated;
      if (_isAutomated) {
        _startTimer(); // Démarre le timer si l'automatisation est activée
      } else {
        _timer.cancel(); // Arrête le timer si l'automatisation est désactivée
      }
    });
  }

  // Fonction pour démarrer le timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        // Mise à jour des paramètres selon des fonctions sinusiennes
        rotateX = (sin(2 * pi * freqRotateX * timer.tick / 100) * 1.5) + 1.5;
        rotateY = (sin(2 * pi * freqRotateY * timer.tick / 100) * 1.5) + 1.5;
        scale = (sin(2 * pi * freqScale * timer.tick / 100) * 2) + 2;
        // mirror = sin(2 * pi * freqMirror * timer.tick / 100) > 0;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Par exemple, tu peux définir une couleur transparente si tu ne veux pas de fond visible
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(rotateX)
                      ..rotateY(rotateY)
                      ..scale(mirror ? -1.0 : 1.0)
                      ..scale(scale),
                    child: Image.asset(
                      'assets/images/test.jpg',
                      width: constraints.maxWidth,    // Prend la largeur de l'écran
                      height: constraints.maxHeight,  // Prend la hauteur de l'écran
                      fit: BoxFit.contain,            // Garde les proportions de l'image
                    ),
                  ),
                ),
              ),
              // Utilisation d'IntrinsicHeight pour réduire la taille de la colonne
              IntrinsicHeight(
                child: Column(
                  children: [
                    Slider(
                      value: rotateX,
                      onChanged: (newRotateX) {
                        setState(() {
                          rotateX = newRotateX;
                        });
                      },
                      min: 0,
                      max: 3,
                    ),
                    Slider(
                      value: rotateY,
                      onChanged: (newRotateY) {
                        setState(() {
                          rotateY = newRotateY;
                        });
                      },
                      min: 0,
                      max: 3,
                    ),
                    Checkbox(
                      value: mirror,
                      onChanged: (newMirror) {
                        setState(() {
                          mirror = newMirror!;
                        });
                      },
                    ),
                    Slider(
                      value: scale,
                      onChanged: (newScale) {
                        setState(() {
                          scale = newScale;
                        });
                      },
                      min: 0,
                      max: 5,
                    ),
                    ElevatedButton(
                      onPressed: _toggleAutomation, // Appel la fonction pour démarrer/arrêter l'automatisation
                      child: Text(_isAutomated ? 'Pause' : 'Play'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
}

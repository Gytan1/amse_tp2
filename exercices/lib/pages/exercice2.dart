import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page_state.dart';

class Exercice2Page extends StatefulWidget {
  const Exercice2Page({super.key});

  @override
  _Exercice2PageState createState() => _Exercice2PageState();
}

class _Exercice2PageState extends State<Exercice2Page> {
  double rotateX = 0;
  double rotateY = 0;
  bool mirror = false;
  double scale = 1;
  
  Timer? _timer; // Rend le timer nullable avec '?'
  bool _isAutomated = false;

  final double freqRotateX = 0.5;
  final double freqRotateY = 0.3;
  final double freqScale = 0.2;
  final double freqMirror = 0.5;

  @override
  void initState() {
    super.initState();
  }

  void _toggleAutomation() {
    setState(() {
      _isAutomated = !_isAutomated;
      if (_isAutomated) {
        _startTimer();
      } else {
        _timer?.cancel(); // Annule seulement si le timer existe
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        rotateX = (sin(2 * pi * freqRotateX * timer.tick / 100) * 1.5) + 1.5;
        rotateY = (sin(2 * pi * freqRotateY * timer.tick / 100) * 1.5) + 1.5;
        scale = (sin(2 * pi * freqScale * timer.tick / 100) * 2) + 2;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Annule seulement si le timer existe
    super.dispose();
  }

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
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
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
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: Column(
                    children: [
                      Slider(
                        value: rotateX,
                        onChanged: (newRotateX) => setState(() => rotateX = newRotateX),
                        min: 0,
                        max: 3,
                      ),
                      Slider(
                        value: rotateY,
                        onChanged: (newRotateY) => setState(() => rotateY = newRotateY),
                        min: 0,
                        max: 3,
                      ),
                      Checkbox(
                        value: mirror,
                        onChanged: (newMirror) => setState(() => mirror = newMirror!),
                      ),
                      Slider(
                        value: scale,
                        onChanged: (newScale) => setState(() => scale = newScale),
                        min: 0,
                        max: 5,
                      ),
                      ElevatedButton(
                        onPressed: _toggleAutomation,
                        child: Text(_isAutomated ? 'Pause' : 'Play'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
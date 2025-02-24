import 'package:flutter/material.dart';

class Exercice5Page extends StatelessWidget {
  const Exercice5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
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
        );
      }
    );
  }
}

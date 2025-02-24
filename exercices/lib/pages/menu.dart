import 'package:flutter/material.dart';
import 'exercice1.dart';
import 'exercice2.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_left_sharp),
                title: Text("Exercice 1"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice1Page()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.arrow_left_sharp),
                title: Text("Exercice 2"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice2Page()));
                },
              ),
            )
          ],
        );
      },
    );
  }
}

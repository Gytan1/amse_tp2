import 'package:flutter/material.dart';

class PageState extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notifie les écouteurs du changement
  }
}
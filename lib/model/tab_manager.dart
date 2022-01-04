import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  // TabManager({required this.selectedTab});

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }
}

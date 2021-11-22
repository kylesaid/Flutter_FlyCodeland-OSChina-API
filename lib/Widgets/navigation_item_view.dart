import 'package:flutter/material.dart';

class NavigationIconView {
  final String title;
  final String iconPath;
  final String selIconPath;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {required this.title, required this.iconPath, required this.selIconPath})
      : item = BottomNavigationBarItem(
          icon: Image.asset(iconPath, width: 25.0, height: 25.0),
          activeIcon: Image.asset(selIconPath, width: 25.0, height: 25.0),
          label: title,
        );
}

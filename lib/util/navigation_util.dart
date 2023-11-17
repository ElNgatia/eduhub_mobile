import 'package:flutter/material.dart';

class NavigationUtil {
  static void onItemTapped(BuildContext context, int index) {
    // Handle navigation
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/analytics');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 4:
        Navigator.pushNamed(context, '/account');
        break;
      default:
        break;
    }
  }
}
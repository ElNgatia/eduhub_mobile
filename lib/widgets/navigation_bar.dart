// home
// search/ add
// account
// analytics
// notifications

import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Analytics'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), 
            label: 'Add'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), 
            label: 'Notifications'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), 
            label: 'Account'),
      ],
    );
  }
}

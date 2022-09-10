import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final void Function(int) onTap;
  final int selectedIndex;
  const BottomBar({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: Colors.blue,
      iconSize: 30,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blue.shade200,
      selectedIconTheme: const IconThemeData(size: 35),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_red_eye_outlined),
          label: 'Result',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Pros',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_circle_outline),
          label: 'Cons',
        ),
      ],
    );
  }
}

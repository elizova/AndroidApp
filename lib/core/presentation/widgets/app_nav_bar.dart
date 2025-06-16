import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  final int currentIndex;

  const AppNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (currentIndex == index) return;
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/activities');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run_outlined),
          activeIcon: Icon(Icons.directions_run),
          label: 'Activities',
        ),
      ],
    );
  }
}

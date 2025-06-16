import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../../features/activity/presentation/screens/activity_list_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfileScreen(),
    const ActivityListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
      ),
    );
  }
} 
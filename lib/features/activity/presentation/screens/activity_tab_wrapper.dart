import 'package:android_app/features/activity/presentation/screens/activities_tab.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Активность'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Моя'),
              Tab(text: 'Пользователи'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActivitiesTab(),
            Center(child: Text('Активности пользователей')),
          ],
        ),
      ),
    );
  }
}

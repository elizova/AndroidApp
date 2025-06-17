import 'package:android_app/features/activity/presentation/screens/activities_tab.dart';
import 'package:flutter/material.dart';

class ActivityTabs extends StatelessWidget {
  const ActivityTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            ColoredBox(
              color: AppBarTheme.of(context).backgroundColor!,
              child: const SafeArea(
                child: TabBar(
                  tabs: [
                    Tab(text: 'Моя'),
                    Tab(text: 'Пользователей'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ActivitiesTab(),
                  Center(child: Text('Активности пользователей')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

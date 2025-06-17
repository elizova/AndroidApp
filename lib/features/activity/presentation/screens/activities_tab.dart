import 'package:android_app/core/routes/app_routes.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/presentation/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActivityBloc, ActivityState>(
        builder: (context, activities) {
          if (activities.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_run,
                    size: 64,
                    color: Theme.of(context).primaryColor.withAlpha(100),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No activities yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start tracking your activities',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ActivityCard(
                activity: activity,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.activityDetail,
                    arguments: activity,
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.newActivity),
        child: const Icon(Icons.add),
      ),
    );
  }
}

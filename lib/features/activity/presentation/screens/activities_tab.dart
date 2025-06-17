import 'package:android_app/core/presentation/app_routes.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/presentation/widgets/activity_card.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({super.key});

  String _getDateGroupHeader(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Сегодня';
    } else if (dateOnly == yesterday) {
      return 'Вчера';
    } else if (dateOnly == tomorrow) {
      return 'Завтра';
    } else {
      return DateFormat('d MMMM yyyy', 'ru_RU').format(date);
    }
  }

  Map<String, List<Activity>> _groupActivitiesByDate(
    IList<Activity> activities,
  ) {
    final grouped = <String, List<Activity>>{};

    for (final activity in activities) {
      final dateKey = _getDateGroupHeader(activity.startTime);
      grouped.putIfAbsent(dateKey, () => []).add(activity);
    }

    return Map.fromEntries(
      grouped.entries.toList()
        ..sort((a, b) {
          final dateA = a.value.first.startTime;
          final dateB = b.value.first.startTime;
          return dateB.compareTo(dateA);
        }),
    );
  }

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
                    'Время потренить',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Нажимай на кнопку ниже и начинаем трекать активность',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final groupedActivities = _groupActivitiesByDate(activities);

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: groupedActivities.length *
                2, // Double because we have headers and items
            itemBuilder: (context, index) {
              final isHeader = index.isEven;
              final groupIndex = index ~/ 2;
              final groupKey = groupedActivities.keys.elementAt(groupIndex);
              final groupActivities = groupedActivities[groupKey]!;

              if (isHeader) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    groupKey,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF808080),
                        ),
                  ),
                );
              } else {
                return Column(
                  children: groupActivities
                      .map((activity) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: ActivityCard(
                              activity: activity,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.activityDetail,
                                  arguments: activity,
                                );
                              },
                            ),
                          ))
                      .toList(),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.newActivity),
        child: const Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}

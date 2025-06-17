import 'package:android_app/domain/entities/activity.dart';
import 'package:flutter/material.dart';

class ActivityDistance extends StatelessWidget {
  const ActivityDistance(this.distance, {super.key});

  final double distance;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${distance.toStringAsFixed(2)} км',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class ActivityTimeAgo extends StatelessWidget {
  const ActivityTimeAgo(this.startTime, {super.key});

  final DateTime startTime;

  @override
  Widget build(BuildContext context) {
    return Text('${DateTime.now().difference(startTime).inHours} часов '
        'назад');
  }
}

class ActivityCurDuration extends StatelessWidget {
  const ActivityCurDuration(this.activity, {super.key});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final curDuration =
        activity.duration ?? DateTime.now().difference(activity.startTime);

    final String text;

    final hours = curDuration.inHours;
    final minutes = curDuration.inMinutes.remainder(60);
    if (hours > 0) {
      text = '$hours ч $minutes мин';
    } else {
      text = '$minutes мин';
    }

    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

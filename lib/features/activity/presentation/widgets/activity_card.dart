import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/widgets/activity_fields.dart';
import 'package:android_app/features/activity/ui_activity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityDistance(activity.distance),
              const SizedBox(height: 4),
              ActivityTimeAgo(activity.startTime),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    activity.type.label,
                  ),
                  const SizedBox(width: 8),
                  Icon(activity.type.icon),
                  const Spacer(),
                  Text(DateFormat('yMd').format(activity.startTime))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

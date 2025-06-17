import 'package:android_app/core/presentation/app_theme.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/widgets/activity_fields.dart';
import 'package:android_app/features/activity/ui_activity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityDetailScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailScreen({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Text(activity.type.label),
            const SizedBox(width: 8),
            Icon(activity.type.icon),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ActivityDistance(activity.distance),
        ActivityTimeAgo(activity.startTime),
        const SizedBox(height: 16),
        ActivityCurDuration(activity),
        Row(
          children: <Widget>[
            Row(
              children: [
                const Text('Старт'),
                const SizedBox(width: 8),
                Text(_formatDateTime(activity.startTime)),
              ],
            ),
            if (activity.endTime != null)
              Row(
                children: [
                  const Text('Финиш'),
                  const SizedBox(width: 8),
                  Text(_formatDateTime(activity.endTime!)),
                ],
              ),
          ].addBetween(const Text('  |  ')),
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: 'comment_stub',
          decoration: const InputDecoration(
            hintText: 'Комментарий',
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}

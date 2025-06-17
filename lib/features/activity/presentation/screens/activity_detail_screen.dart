import 'package:android_app/core/theme/app_theme.dart';
import 'package:android_app/domain/entities/activity.dart';
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
        _buildInfoRow(
          context,
          '${activity.distance.toStringAsFixed(2)} км',
        ),
        Text('${DateTime.now().difference(activity.startTime).inHours} часов '
            'назад'),
        const SizedBox(height: 16),
        _buildInfoRow(
          context,
          _formatDuration(curDuration),
        ),
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
          decoration: InputDecoration(
            hintText: 'Комментарий',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String value,
  ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }

  Duration get curDuration =>
      activity.duration ?? DateTime.now().difference(activity.startTime);

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '$hours ч $minutes мин';
    }
    return '$minutes мин';
  }
}

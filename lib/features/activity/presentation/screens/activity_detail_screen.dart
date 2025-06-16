import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/widgets/activity_card.dart';
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
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildInfoSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          activityIcon(activity.type),
          color: Theme.of(context).primaryColor,
          size: 32,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.username,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              activity.type.toString().split('.').last.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(
          context,
          'Distance',
          '123 km',
          Icons.route,
        ),
        const SizedBox(height: 16),
        if (activity.duration != null)
          _buildInfoRow(
            context,
            'Duration',
            _formatDuration(activity.duration!),
            Icons.timer,
          ),
        const SizedBox(height: 16),
        _buildInfoRow(
          context,
          'Start Time',
          _formatDateTime(activity.startTime),
          Icons.play_arrow,
        ),
        if (activity.endTime != null) ...[
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            'End Time',
            _formatDateTime(activity.endTime!),
            Icons.stop,
          ),
        ],
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm, dd MMM yyyy').format(dateTime);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '$hours h $minutes min';
    }
    return '$minutes min';
  }
}

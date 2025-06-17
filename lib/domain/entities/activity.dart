import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

enum ActivityType {
  bicycle,
  running,
  walking,
}

@freezed
class Activity with _$Activity {
  @override
  final int id;
  @override
  final ActivityType type;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;

  Activity({
    required this.id,
    required this.type,
    required this.startTime,
    this.endTime,
  }) : duration = endTime?.difference(startTime);

  @override
  final Duration? duration;
  @override
  final String username = '@stub_user_name';
  @override
  final double distance = 14.88;
}

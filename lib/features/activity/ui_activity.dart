import 'package:android_app/domain/entities/activity.dart';
import 'package:flutter/material.dart';

extension UiActivity on ActivityType {
  String get label => switch (this) {
        ActivityType.bicycle => 'Велосипед',
        ActivityType.running => 'Бег',
        ActivityType.walking => 'Шаг',
      };

  IconData get icon => switch (this) {
        ActivityType.bicycle => Icons.directions_bike,
        ActivityType.running => Icons.directions_run,
        ActivityType.walking => Icons.directions_walk
      };
}

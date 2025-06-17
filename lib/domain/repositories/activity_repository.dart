import 'package:android_app/domain/entities/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getActivities();
  Future<int> createActivity(Activity activity);
}

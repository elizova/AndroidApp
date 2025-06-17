import 'package:android_app/data/database/database_helper.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final DatabaseHelper _databaseHelper;

  ActivityRepositoryImpl(this._databaseHelper);

  @override
  Future<List<Activity>> getActivities() async {
    return await _databaseHelper.getActivities();
  }

  @override
  Future<int> createActivity(Activity activity) async {
    return await _databaseHelper.insertActivity(activity);
  }
}

import 'package:android_app/domain/entities/activity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "activity_tracker.db";
  static const _databaseVersion = 1;

  static const tableActivities = 'activities';

  static const columnId = 'id';
  static const columnType = 'type';
  static const columnStartTime = 'start_time';
  static const columnEndTime = 'end_time';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableActivities (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnType TEXT NOT NULL,
        $columnStartTime INTEGER NOT NULL,
        $columnEndTime INTEGER
      )
    ''');
  }

  Future<int> insertActivity(Activity activity) async {
    final db = await database;
    return await db.insert(
      tableActivities,
      {
        columnType: activity.type.toString(),
        columnStartTime: activity.startTime.millisecondsSinceEpoch,
        columnEndTime: activity.endTime?.millisecondsSinceEpoch,
      },
    );
  }

  Future<List<Activity>> getActivities() async {
    final db = await database;
    final List<Map<String, dynamic>> activityMaps =
        await db.query(tableActivities);

    return activityMaps
        .map((map) => Activity(
              id: map[columnId],
              type: ActivityType.values.firstWhere(
                (e) => e.toString() == map[columnType],
              ),
              startTime:
                  DateTime.fromMillisecondsSinceEpoch(map[columnStartTime]),
              endTime: map[columnEndTime] != null
                  ? DateTime.fromMillisecondsSinceEpoch(map[columnEndTime])
                  : null,
            ))
        .toList();
  }

  Future<void> updateActivity(Activity activity) async {
    final db = await database;
    await db.update(
      tableActivities,
      {
        columnType: activity.type.toString(),
        columnStartTime: activity.startTime.millisecondsSinceEpoch,
        columnEndTime: activity.endTime?.millisecondsSinceEpoch,
      },
      where: '$columnId = ?',
      whereArgs: [activity.id],
    );
  }

  Future<void> deleteActivity(int id) async {
    final db = await database;
    await db.delete(
      tableActivities,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

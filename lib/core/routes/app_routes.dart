abstract final class AppRoutes {
  const AppRoutes._();

  // Auth routes
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';

  // Main routes
  static const String main = '/main';
  static const String profile = '$main/profile';
  static const String passwordEditing = '$main/password_editing';

  static const String activities = '$main/activities';
  static const String activityDetail = '$activities/activity-detail';
  static const String newActivity = '$activities/new-activity';
}

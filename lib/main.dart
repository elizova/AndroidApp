import 'package:android_app/core/presentation/app_routes.dart';
import 'package:android_app/core/presentation/app_theme.dart';
import 'package:android_app/data/database/database_helper.dart';
import 'package:android_app/data/repositories/activity_repository_impl.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/presentation/screens/activity_detail_page.dart';
import 'package:android_app/features/activity/presentation/screens/activity_tabs_page.dart';
import 'package:android_app/features/activity/presentation/screens/new_activity_page.dart';
import 'package:android_app/features/auth/presentation/screens/login_page.dart';
import 'package:android_app/features/auth/presentation/screens/register_page.dart';
import 'package:android_app/features/auth/presentation/screens/welcome_page.dart';
import 'package:android_app/features/main_page.dart';
import 'package:android_app/features/profile/presentation/password_editing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseHelper = DatabaseHelper();
    final activityRepository = ActivityRepositoryImpl(databaseHelper);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityBloc(activityRepository)..add(const ActivityEvent.init())),
      ],
      child: MaterialApp(
        title: 'Activity Tracker',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.welcome,
        routes: {
          AppRoutes.welcome: (context) => const WelcomePage(),
          AppRoutes.main: (context) => const MainPage(),
          AppRoutes.passwordEditing: (context) => const PasswordEditingPage(),
          AppRoutes.login: (context) => const LoginPage(),
          AppRoutes.register: (context) => const RegisterPage(),
          AppRoutes.activities: (context) => const ActivityTabsPage(),
          AppRoutes.activityDetail: (context) {
            final activity =
                ModalRoute.of(context)!.settings.arguments as Activity;
            return ActivityDetailPage(activity: activity);
          },
          AppRoutes.newActivity: (context) => const NewActivityPage(),
        },
      ),
    );
  }
}

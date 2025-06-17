import 'package:android_app/core/routes/app_routes.dart';
import 'package:android_app/core/theme/app_theme.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/presentation/screens/activity_detail_screen.dart';
import 'package:android_app/features/activity/presentation/screens/activity_tabs.dart';
import 'package:android_app/features/activity/presentation/screens/new_activity_screen.dart';
import 'package:android_app/features/auth/presentation/screens/login_screen.dart';
import 'package:android_app/features/auth/presentation/screens/register_screen.dart';
import 'package:android_app/features/auth/presentation/screens/welcome_screen.dart';
import 'package:android_app/features/main_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityBloc()),
      ],
      child: MaterialApp(
        title: 'Activity Tracker',
        theme: AppTheme.lightTheme,
        initialRoute: '/welcome',
        routes: {
          AppRoutes.welcome: (context) => const WelcomeScreen(),
          AppRoutes.main: (context) => const MainScreen(),
          AppRoutes.passwordEditing: (context) => const PasswordEditingPage(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.activities: (context) => const ActivityTabs(),
          AppRoutes.activityDetail: (context) {
            final activity =
                ModalRoute.of(context)!.settings.arguments as Activity;
            return ActivityDetailScreen(activity: activity);
          },
          AppRoutes.newActivity: (context) => const NewActivityScreen(),
        },
      ),
    );
  }
}

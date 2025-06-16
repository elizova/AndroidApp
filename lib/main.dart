import 'package:android_app/core/routes/app_routes.dart';
import 'package:android_app/core/theme/app_theme.dart';
import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:android_app/features/activity/presentation/screens/activity_detail_screen.dart';
import 'package:android_app/features/activity/presentation/screens/activity_list_screen.dart';
import 'package:android_app/features/activity/presentation/screens/new_activity_screen.dart';
import 'package:android_app/features/auth/presentation/screens/login_screen.dart';
import 'package:android_app/features/auth/presentation/screens/register_screen.dart';
import 'package:android_app/features/auth/presentation/screens/welcome_screen.dart';
import 'package:android_app/features/profile/presentation/screens/profile_screen.dart';
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
        initialRoute: AppRoutes.welcome,
        routes: {
          AppRoutes.welcome: (context) => const WelcomeScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.activities: (context) => const ActivityListScreen(),
          AppRoutes.activityDetail: (context) {
            final activity = ModalRoute.of(context)!.settings.arguments as Activity;
            return ActivityDetailScreen(activity: activity);
          },
          AppRoutes.newActivity: (context) => const NewActivityScreen(),
          AppRoutes.profile: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ActivityListScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_run),
            label: 'Активность',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewActivityScreen(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

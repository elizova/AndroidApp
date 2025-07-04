import 'package:android_app/core/presentation/app_routes.dart';
import 'package:android_app/core/presentation/app_theme.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Expanded(
              child: Image.asset(
                'assets/images/welcome.png',
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Пожалуй, лучший фитнес трекер в ДВФУ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Созданный студентами',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.register),
                    child: const Text('Зарегистрироваться'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.login),
                    child: const Text('Уже есть аккаунт'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:android_app/core/presentation/extensions.dart';
import 'package:android_app/core/routes/app_routes.dart';
import 'package:android_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          TextButton(
            onPressed: () => FocusScope.of(context).unfocus(),
            child: const Text('Сохранить'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: 'stub_login',
              decoration: const InputDecoration(
                labelText: 'Логин',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: 'stub_name',
              decoration: const InputDecoration(
                labelText: 'Имя или никнейм',
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.passwordEditing),
              child: const Text('Изменить пароль'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final nav = Navigator.of(context);
                  nav.popAllButOne();
                  nav.pushReplacementNamed(AppRoutes.welcome);
                },
                child: const Text('Выйти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:android_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordEditingPage extends StatelessWidget {
  const PasswordEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      appBar: AppBar(
        title: const Text('Изменить пароль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Старый пароль',
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Новый пароль',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Повторите пароль',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Принять'),
            )
          ],
        ),
      ),
    );
  }
}

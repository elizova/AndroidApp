import 'package:android_app/core/presentation/app_theme.dart';
import 'package:android_app/core/presentation/image_assets.dart';
import 'package:android_app/core/presentation/widgets/obscured_text_field.dart';
import 'package:android_app/features/auth/presentation/navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Image.asset(ImageAssets.bicycles),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Логин',
              ),
            ),
            const SizedBox(height: 16),
            const ObscuredTextField(label: 'Пароль'),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => AuthNavigation.navigateOnAuthed(context),
                child: const Text('Войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

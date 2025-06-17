import 'package:android_app/core/presentation/app_theme.dart';
import 'package:android_app/features/auth/presentation/navigation.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Genders? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteBackgroundColor,
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Логин',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Имя или никнейм',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Пароль',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Повторить пароль',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  Пол',
                style: TextTheme.of(context).titleLarge,
              ),
              for (final gender in Genders.values)
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  value: gender,
                  groupValue: _selectedGender,
                  title: Text(gender.label),
                  onChanged: (gender) =>
                      setState(() => _selectedGender = gender),
                ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => AuthNavigation.navigateOnAuthed(context),
            child: const Text('Зарегистрироваться'),
          ),
          const SizedBox(height: 24),
          const Text(
            'Нажимая на кнопку, вы соглашаетесь\nс политикой '
            'конфиденциальности и обработки персональных данных, а '
            'также принимаете пользовательское соглашение',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

enum Genders {
  male,
  female,
  other;

  String get label {
    return switch (this) {
      Genders.male => 'Мужской',
      Genders.female => 'Женский',
      Genders.other => 'Другое',
    };
  }
}

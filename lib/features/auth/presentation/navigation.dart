import 'package:android_app/core/presentation/extensions.dart';
import 'package:android_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

abstract final class AuthNavigation {
  static void navigateOnAuthed(BuildContext context) {
    Navigator.of(context).popAllButOne();
    Navigator.pushReplacementNamed(context, AppRoutes.main);
  }
}

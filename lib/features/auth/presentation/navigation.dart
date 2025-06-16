import 'package:android_app/core/presentation/extensions.dart';
import 'package:android_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

abstract final class AuthNavigation {
  static void navigateAfterAuth(BuildContext context) {
    Navigator.of(context).popAll();
    Navigator.pushReplacementNamed(context, AppRoutes.activities);
  }
}

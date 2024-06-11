import 'package:flutter/material.dart';
import 'package:profile_demo_app/routing/app_routes.dart';

Future<void> startApplication() async {
  runApp(
    const MaterialApp(
      title: 'Profile Demo App',
      onGenerateRoute: AppRoutes.routes,
    ),
  );
}

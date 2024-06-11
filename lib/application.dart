import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile_demo_app/firebase_options.dart';
import 'package:profile_demo_app/routing/app_routes.dart';
import 'package:profile_demo_app/utils/utils.dart';

Future<void> startApplication() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUpGetIt();

  runApp(
    const MaterialApp(
      title: 'Profile Demo App',
      onGenerateRoute: AppRoutes.routes,
    ),
  );
}

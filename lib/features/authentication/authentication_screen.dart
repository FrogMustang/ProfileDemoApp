import 'package:flutter/material.dart';
import 'package:profile_demo_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:profile_demo_app/features/authentication/home_screen.dart';
import 'package:profile_demo_app/features/authentication/sign_in_screen.dart';
import 'package:profile_demo_app/utils/utils.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return getIt.get<AuthenticationBloc>().state.user != null
        ? const HomeScreen()
        : const SignInScreen();
  }
}

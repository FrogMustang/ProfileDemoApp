import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:profile_demo_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:profile_demo_app/repositories/authentication_repository.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 5,
    errorMethodCount: 15,
  ),
);

final GetIt getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerLazySingleton<IAuthenticationRepository>(
    () => IAuthenticationRepository(),
  );

  getIt.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      auth: getIt.get<IAuthenticationRepository>(),
    ),
  );
}

InputDecoration defaultFormFieldStyle({required String label}) {
  return InputDecoration(
    border: InputBorder.none,
    filled: true,
    fillColor: CustomColors.lightGreen,
    labelText: label,
    labelStyle: const TextStyle(
      color: CustomColors.lightGray,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}

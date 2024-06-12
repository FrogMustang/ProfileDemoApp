import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_demo_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:profile_demo_app/features/authentication/home_screen.dart';
import 'package:profile_demo_app/features/authentication/sign_in_screen.dart';
import 'package:profile_demo_app/features/authentication/sign_up_screen.dart';
import 'package:profile_demo_app/repositories/authentication_repository.dart';
import 'package:profile_demo_app/routing/app_routes_constants.dart';
import 'package:profile_demo_app/utils/utils.dart';

Future<Widget> singleTestWidget({
  required Widget widget,
}) async {
  await setUpGetIt(usedForTesting: true);

  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(
          auth: getIt.get<IAuthenticationRepository>(),
          usedForTesting: true,
        ),
      ),
    ],
    child: MaterialApp(
      routes: _mockedTestingRoutes(),
      home: Scaffold(
        body: widget,
      ),
    ),
  );
}

/// Mocked routes for testing purposes.
///
/// Returns a map of mocked routes with their respective widget builders.
Map<String, WidgetBuilder> _mockedTestingRoutes() {
  return <String, WidgetBuilder>{
    kSignInScreen: (context) => const SignInScreen(),
    kSignUpScreen: (context) => const SignUpScreen(),
    kHomeScreen: (context) => const HomeScreen(),
  };
}

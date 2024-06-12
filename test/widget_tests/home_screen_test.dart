import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_demo_app/features/authentication/sign_in_screen.dart';
import 'package:profile_demo_app/utils/custom_icons.dart';
import 'package:profile_demo_app/utils/widget_keys.dart';
import 'package:profile_demo_app/widgets/social_login_button.dart';

import '../test_utils.dart';

void main() {
  group(
    'home screen tests',
    () {
      testWidgets(
        'test home screen widgets',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            await singleTestWidget(
              widget: const SignInScreen(),
            ),
          );

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is SignInScreen;
              },
            ),
            findsOneWidget,
          );

          // SCREEN TITLE
          expect(
            find.text('Sign In'),
            findsOneWidget,
          );

          expect(
            find.text('Sign Up'),
            findsNothing,
          );

          // SCREEN IMAGE
          expect(
            find.image(
              const AssetImage(CustomIcons.signInImage),
            ),
            findsOneWidget,
          );

          expect(
            find.image(
              const AssetImage(CustomIcons.signUpImage),
            ),
            findsNothing,
          );

          // INPUT FIELDS
          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is TextFormField;
              },
            ),
            findsNWidgets(2),
          );

          // FORGOT PASS
          expect(
            find.text('Forgot your password?'),
            findsOneWidget,
          );

          // SIGN IN BUTTON
          expect(
            find.byKey(
              const Key(WidgetKeys.signInButton),
            ),
            findsOneWidget,
          );
          expect(
            find.byKey(
              const Key(WidgetKeys.signUpButton),
            ),
            findsNothing,
          );

          // OR
          expect(
            find.text('or'),
            findsOneWidget,
          );

          // SOCIALS LOGIN BUTTONS
          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is SocialLoginButton &&
                    widget.svgIcon == CustomIcons.facebook;
              },
            ),
            findsOneWidget,
          );

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is SocialLoginButton &&
                    widget.svgIcon == CustomIcons.twitter;
              },
            ),
            findsOneWidget,
          );

          expect(
            find.byWidgetPredicate(
              (widget) {
                return widget is SocialLoginButton &&
                    widget.svgIcon == CustomIcons.linkedIn;
              },
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}

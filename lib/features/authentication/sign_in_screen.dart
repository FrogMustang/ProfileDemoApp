import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:profile_demo_app/features/authentication/bloc/authentication_bloc.dart';
import 'package:profile_demo_app/routing/app_routes_constants.dart';
import 'package:profile_demo_app/utils/constants.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';
import 'package:profile_demo_app/utils/custom_icons.dart';
import 'package:profile_demo_app/utils/utils.dart';
import 'package:profile_demo_app/widgets/primary_button.dart';
import 'package:profile_demo_app/widgets/social_login_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listenWhen: (prev, curr) {
      return prev.status.isSubmissionInProgress &&
          (curr.status.isSubmissionSuccess || curr.status.isSubmissionFailure);
    }, listener: (context, state) {
      if (state.status.isSubmissionFailure) {
        CustomSnackBar.show(
          context,
          state.error!,
          isError: true,
        );
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            // actions: [],
            centerTitle: true,
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kHorScreenPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(
                    CustomIcons.signInImage,
                    height: 145,
                  ),
                  const SizedBox(height: 50),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // USERNAME
                        SizedBox(
                          height: 80,
                          child: TextFormField(
                            cursorColor: CustomColors.lightGray,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration:
                                defaultFormFieldStyle(label: 'Username'),
                            validator: (String? val) {
                              return val == null ||
                                      val.isEmpty ||
                                      !EmailValidator.validate(val)
                                  ? 'Please enter a valid username'
                                  : null;
                            },
                            onChanged: (String val) {
                              setState(() {
                                username = val;
                              });
                            },
                          ),
                        ),

                        // PASSWORD
                        SizedBox(
                          height: 80,
                          child: TextFormField(
                            cursorColor: CustomColors.lightGray,
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration:
                                defaultFormFieldStyle(label: 'Password'),
                            validator: (String? val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter a password';
                              }

                              if (val.length < 8) {
                                return 'Password must be at least 8 chars long';
                              }

                              return null;
                            },
                            onChanged: (String val) {
                              setState(() {
                                pass = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // FORGOT PASSWORD
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: CustomColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // LOGIN BUTTON
                  PrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true) {
                        getIt.get<AuthenticationBloc>().add(
                              AuthenticationLoggedIn(
                                username: username,
                                password: pass,
                              ),
                            );
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: CustomColors.gray,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // SOCIALS LOGIN BUTTONS
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialLoginButton(
                        svgIcon: CustomIcons.facebook,
                      ),
                      SocialLoginButton(
                        svgIcon: CustomIcons.twitter,
                      ),
                      SocialLoginButton(
                        svgIcon: CustomIcons.linkedIn,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // SIGN UP BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, kSignUpScreen);
                    },
                    child: EasyRichText(
                      "Don't have an account? *Sign Up*",
                      defaultStyle: const TextStyle(
                        color: CustomColors.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      patternList: [
                        EasyRichTextPattern(
                          // matches anything that is between *
                          // (e.g. This is *matched* but this is not)
                          targetString: '(\\*)(.*?)(\\*)',
                          matchBuilder: (
                            BuildContext context,
                            RegExpMatch? match,
                          ) {
                            return TextSpan(
                              text: match?[0]?.replaceAll('*', ''),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: CustomColors.salmon,
                                decoration: TextDecoration.underline,
                                decorationColor: CustomColors.salmon,
                                decorationThickness: 0.5,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

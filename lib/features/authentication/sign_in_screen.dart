import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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

                // USERNAME
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorColor: CustomColors.lightGray,
                    decoration: defaultFormFieldStyle(label: 'Username'),
                  ),
                ),
                const SizedBox(height: 16),

                // PASSWORD
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorColor: CustomColors.lightGray,
                    decoration: defaultFormFieldStyle(label: 'Password'),
                  ),
                ),
                const SizedBox(height: 14),

                // FORGOT PASSWORD
                GestureDetector(
                  onTap: () {},
                  child: const Align(
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
                ),
                const SizedBox(height: 50),

                // LOGIN BUTTON
                PrimaryButton(
                  onPressed: () {
                    // TODO: handle login
                    Navigator.pushNamed(
                      context,
                      kHomeScreen,
                    );
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
  }
}

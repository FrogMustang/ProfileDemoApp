import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_demo_app/utils/constants.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';
import 'package:profile_demo_app/utils/custom_icons.dart';
import 'package:profile_demo_app/utils/utils.dart';
import 'package:profile_demo_app/widgets/primary_button.dart';
import 'package:profile_demo_app/widgets/social_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          automaticallyImplyLeading: false,
          leadingWidth: 10 + Constants.kHorScreenPadding,
          leading: Row(
            children: [
              const SizedBox(
                width: Constants.kHorScreenPadding,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  CustomIcons.carretLeft,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: Constants.kHorScreenPadding),
              child: SvgPicture.asset(
                CustomIcons.menu,
              ),
            ),
          ],
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
                  CustomIcons.signUpImage,
                  height: 145,
                ),
                const SizedBox(height: 50),

                // USERNAME
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorColor: CustomColors.lightGray,
                    decoration: defaultFormFieldStyle(label: 'Enter email'),
                  ),
                ),
                const SizedBox(height: 16),

                // PASSWORD
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorColor: CustomColors.lightGray,
                    decoration: defaultFormFieldStyle(label: 'Enter password'),
                  ),
                ),
                const SizedBox(height: 14),

                // CONFIRM PASSWORD
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorColor: CustomColors.lightGray,
                    decoration:
                        defaultFormFieldStyle(label: 'Confirm password'),
                  ),
                ),
                const SizedBox(height: 14),

                // SIGN UP BUTTON
                PrimaryButton(
                  onPressed: () {
                    // TODO: handle register
                  },
                  text: 'Sign Up',
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

                // SIGN IN BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: EasyRichText(
                    "Already have an account? *Sign In*",
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

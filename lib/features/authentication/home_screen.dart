import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_demo_app/utils/constants.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';
import 'package:profile_demo_app/utils/custom_icons.dart';
import 'package:profile_demo_app/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: Constants.kHorScreenPadding),
              child: SvgPicture.asset(
                CustomIcons.menu,
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kHorScreenPadding,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Image.asset(
                        CustomIcons.profilePicture,
                        height: 145,
                      ),
                      const SizedBox(height: 22),

                      // USERNAME
                      const Text(
                        // TODO replace with actual username
                        'Username',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 24,
                          color: CustomColors.dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // DETAILS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // LOCATION
                          const Text(
                            'New York',
                            style: TextStyle(
                              color: CustomColors.gray,
                              fontSize: 16,
                            ),
                          ),

                          // dot
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            height: 5,
                            width: 5,
                            color: const Color.fromRGBO(181, 195, 199, 1),
                          ),

                          // ID
                          const Text(
                            // TODO replace with actual ID
                            'ID: 112061',
                            style: TextStyle(
                              color: CustomColors.gray,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17),

                      // EDIT BUTTON
                      const Text(
                        'Edit',
                        style: TextStyle(
                          color: CustomColors.salmon,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomColors.salmon,
                          decorationThickness: 0.5,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          // ABOUT ME
                          const Flexible(
                            child: PrimaryButton(
                              outlinedStyle: true,
                              text: 'About Me',
                            ),
                          ),
                          const SizedBox(width: 15),

                          // LOG OUT
                          Flexible(
                            child: PrimaryButton(
                              onPressed: () {
                                // TODO handle logout
                                Navigator.pop(context);
                              },
                              text: 'Log Out',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),

                // BOTTOM INFO
                Container(
                  height: 352,
                  color: CustomColors.dark,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kHorScreenPadding,
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 40),
                      ProfileInfoBanner(
                        icon: CustomIcons.phone,
                        title: 'Phone number',
                        subtitle: '+3788888888',
                      ),
                      SizedBox(height: 16),
                      ProfileInfoBanner(
                        icon: CustomIcons.phone,
                        title: 'Email',
                        subtitle: 'user@gmail.com',
                      ),
                      SizedBox(height: 16),
                      ProfileInfoBanner(
                        icon: CustomIcons.phone,
                        title: 'Completed projects',
                        subtitle: '248',
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoBanner extends StatelessWidget {
  const ProfileInfoBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 27,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.dutchSummerSky,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          // ICON
          SvgPicture.asset(
            icon,
            width: 18,
          ),
          const SizedBox(width: 15),

          // DIVIDER
          const VerticalDivider(
            color: CustomColors.dutchSummerSky,
            thickness: 0.5,
          ),

          const SizedBox(width: 15),

          // TITLE AND SUBTITLE
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: CustomColors.gray,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: CustomColors.dutchSummerSky,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

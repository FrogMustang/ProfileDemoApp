import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 46,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.lighterGray,
          ),
        ),
        child: SvgPicture.asset(
          svgIcon,
        ),
      ),
    );
  }
}
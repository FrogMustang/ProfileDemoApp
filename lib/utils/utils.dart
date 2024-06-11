import 'package:flutter/material.dart';
import 'package:profile_demo_app/utils/custom_colors.dart';

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

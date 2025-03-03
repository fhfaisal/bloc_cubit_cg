import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class AppChipTheme {
  AppChipTheme._();
  static const String fontFamily = AppConstants.fontFamily;
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColors.black,fontFamily: fontFamily),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.white,
  ); // ChipThemeData

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.darkerGrey,
    labelStyle: TextStyle(color: AppColors.white,fontFamily: fontFamily),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppColors.white,
  ); // ChipThemeData
}

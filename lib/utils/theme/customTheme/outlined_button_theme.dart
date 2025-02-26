import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 1,
      fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
      foregroundColor: AppColors.black,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.transparent,
      side: const BorderSide(color: AppColors.black),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600,fontFamily: fontFamily),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  ///DorkTheme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
    foregroundColor: AppColors.white,
    disabledForegroundColor: AppColors.grey,
    disabledBackgroundColor: Colors.transparent,
    side: const BorderSide(color: AppColors.grey),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    textStyle: const TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600,fontFamily: fontFamily),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}

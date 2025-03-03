import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
      foregroundColor: Colors.white,
      backgroundColor: AppColors.dark,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.transparent,
      //side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600,fontFamily: fontFamily),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  ///DorkTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.transparent,
    //side: const BorderSide(color: AppColors.primary),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    textStyle: const TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600,fontFamily: fontFamily),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}

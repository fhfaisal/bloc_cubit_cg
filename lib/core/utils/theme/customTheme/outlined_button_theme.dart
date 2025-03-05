import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
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
      elevation: AppSizes.elevation2,
      fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
      foregroundColor: AppColors.black,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: AppColors.grey,
      disabledBackgroundColor: Colors.transparent,
      //side: const BorderSide(color: AppColors.black),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      textStyle:  AppTextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  ///DorkTheme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: AppSizes.elevation2,
    fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
    foregroundColor: AppColors.white,
    disabledForegroundColor: AppColors.grey,
    disabledBackgroundColor: Colors.transparent,
    //side: const BorderSide(color: AppColors.grey),
    //padding: const EdgeInsets.symmetric(horizontal: 20),
    textStyle: AppTextTheme.darkTextTheme.titleLarge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}

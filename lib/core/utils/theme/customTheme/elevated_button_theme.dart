import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
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
      elevation: AppSizes.elevation2,
      fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
      foregroundColor: Colors.white,
      backgroundColor: AppColors.dark,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.transparent,
      //side: const BorderSide(color: AppColors.primary),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      textStyle: AppTextTheme.lightTextTheme.titleMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  ///DorkTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: AppSizes.elevation2,
    fixedSize: const Size.fromHeight(AppSizes.buttonHeight52),
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
    disabledForegroundColor: AppColors.grey,
    disabledBackgroundColor: Colors.transparent,
    //side: const BorderSide(color: AppColors.primary),
    //padding: const EdgeInsets.symmetric(horizontal: 20),
    textStyle: AppTextTheme.darkTextTheme.titleMedium,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}

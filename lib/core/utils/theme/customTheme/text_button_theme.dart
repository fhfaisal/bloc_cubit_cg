import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.all(const Size.fromHeight(AppSizes.buttonHeight52)),
      foregroundColor: WidgetStateProperty.all(AppColors.black),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius12))),
      //side: MaterialStateProperty.all(const BorderSide(color: AppColors.grey)),
      textStyle: WidgetStateProperty.all(AppTextTheme.lightTextTheme.titleLarge),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );

  ///DorkTheme
  static final darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.all(const Size.fromHeight(AppSizes.buttonHeight52)),
      foregroundColor: WidgetStateProperty.all(AppColors.primary),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius12))),
      //side: MaterialStateProperty.all(const BorderSide(color: AppColors.grey)),
      textStyle: WidgetStateProperty.all(AppTextTheme.darkTextTheme.titleLarge),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._(); //To avoid creating instances

  ///Light Theme
  static final lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(AppColors.dark),
      fixedSize: WidgetStateProperty.all(const Size.fromHeight(AppSizes.buttonHeight52)),
      foregroundColor: WidgetStateProperty.all(AppColors.black),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      //side: MaterialStateProperty.all(const BorderSide(color: AppColors.grey)),
      textStyle: WidgetStateProperty.all(AppTextTheme.lightTextTheme.titleLarge),
      //padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );

  ///DorkTheme
  static final darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.all(const Size.fromHeight(AppSizes.buttonHeight52)),
      iconColor: WidgetStateProperty.all(AppColors.grey),
      foregroundColor: WidgetStateProperty.all(AppColors.grey),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      //side: MaterialStateProperty.all(const BorderSide(color: AppColors.grey)),
      textStyle:WidgetStateProperty.all(AppTextTheme.darkTextTheme.titleLarge),
      //padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
    ),
  );
}

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/sizes.dart';

class AppSearchBarTheme {
  AppSearchBarTheme._();
  static const String fontFamily = AppConstants.fontFamily;
  static final lightSearchBar = SearchBarThemeData(
    elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  AppSizes.inputFieldRadius12),
            side: BorderSide(color: AppColors.primary5)
          )),
    backgroundColor: WidgetStateProperty.all(AppColors.searchBg),
    textStyle: WidgetStateProperty.all(const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: AppColors.secondary,fontFamily:fontFamily)),
    hintStyle: WidgetStateProperty.all(const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w400, color: AppColors.tertiaryText,fontFamily: fontFamily)),
    side: WidgetStateProperty.all(const BorderSide(color: AppColors.primary,))
  );

// AppBar Theme

  static final darkSearchBar = SearchBarThemeData(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius12))));
} // AppBar Theme

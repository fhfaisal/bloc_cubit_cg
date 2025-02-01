import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppMaterialButtonTheme {
  AppMaterialButtonTheme._(); //To avoid creating instances

  ///Light Theme
  static final lightMaterialButtonTheme = MaterialBannerThemeData(
    contentTextStyle: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    padding: const EdgeInsets.symmetric(horizontal: 16)
  );

  ///DorkTheme
  static final darkOutlinedButtonTheme = MaterialBannerThemeData(
      contentTextStyle: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      padding: const EdgeInsets.symmetric(horizontal: 16)
  );
}

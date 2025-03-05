import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class AppMaterialButtonTheme {
  AppMaterialButtonTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightMaterialButtonTheme = MaterialBannerThemeData(
    contentTextStyle: AppTextTheme.darkTextTheme.titleLarge!.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.textPrimary,fontFamily: fontFamily),
    padding: const EdgeInsets.symmetric(horizontal: 16)
  );

  ///DorkTheme
  static final darkOutlinedButtonTheme = MaterialBannerThemeData(
      contentTextStyle:  AppTextTheme.darkTextTheme.titleLarge!.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.textPrimary,fontFamily: fontFamily),
      padding: const EdgeInsets.symmetric(horizontal: 16)
  );
}

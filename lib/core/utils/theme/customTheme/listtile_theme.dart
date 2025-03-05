import 'package:cubit_bloc/core/utils/theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppListTileTheme {
  AppListTileTheme._();

  // ListTile theme for Light Mode
  static final lightListTileTheme = ListTileThemeData(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    horizontalTitleGap: 16.0,
    minLeadingWidth: 40,
    iconColor: AppColors.black,
    textColor: AppColors.black,
    titleTextStyle: AppTextTheme.lightTextTheme.titleMedium,
    subtitleTextStyle: AppTextTheme.darkTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  // ListTile theme for Dark Mode
  static final darkListTileTheme = ListTileThemeData(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    horizontalTitleGap: 16.0,
    minLeadingWidth: 40,
    iconColor: AppColors.white,
    textColor: AppColors.white,
    titleTextStyle: AppTextTheme.darkTextTheme.titleMedium,
    subtitleTextStyle: AppTextTheme.darkTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

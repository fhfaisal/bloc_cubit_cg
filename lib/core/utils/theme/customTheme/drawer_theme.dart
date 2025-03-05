// lib/core/utils/theme/customTheme/drawer_theme.dart
import 'package:cubit_bloc/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppDrawerTheme {
  AppDrawerTheme._();

  /// Drawer theme for the light mode.
  static final lightDrawerTheme = DrawerThemeData(
    backgroundColor: AppColors.white,
    elevation: AppSizes.elevation8,
    // Optional: rounded corners on the right side of the drawer.
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(AppSizes.borderRadius16),
        bottomRight: Radius.circular(AppSizes.borderRadius16),
      ),
    ),
  );

  /// Drawer theme for the dark mode.
  static final darkDrawerTheme = DrawerThemeData(
    backgroundColor: AppColors.dark,
    elevation: AppSizes.elevation8,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(AppSizes.borderRadius16),
        bottomRight: Radius.circular(AppSizes.borderRadius16),
      ),
    ),
  );
}

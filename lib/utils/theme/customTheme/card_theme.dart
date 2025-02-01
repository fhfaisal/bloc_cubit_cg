import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppCardTheme {
  AppCardTheme._();

  static const lightCardTheme = CardTheme(
      elevation: 4,
      margin: EdgeInsets.all(0),
      surfaceTintColor: AppColors.white,
      shadowColor: AppColors.shadowColor
  );

// AppBar Theme

  static const darkCardTheme = CardTheme(
      elevation: 4,
      margin: EdgeInsets.all(0),
      surfaceTintColor: AppColors.black,
      shadowColor: AppColors.shadowColor
  );
} // AppBar Theme

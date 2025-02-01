
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'customTheme/appbar_theme.dart';
import 'customTheme/bottom_navigation_theme.dart';
import 'customTheme/bottom_sheet_theme.dart';
import 'customTheme/card_theme.dart';
import 'customTheme/checkbox_theme.dart';
import 'customTheme/chip_theme.dart';
import 'customTheme/elevated_button_theme.dart';
import 'customTheme/icon_button_theme.dart';
import 'customTheme/input_decoration_theme.dart';
import 'customTheme/outlined_button_theme.dart';
import 'customTheme/search_bar_theme.dart';
import 'customTheme/text_button_theme.dart';
import 'customTheme/text_theme.dart';

class AppTheme {
  AppTheme._();

  ///Light theme
  static ThemeData lightTheme = ThemeData(
      disabledColor: AppColors.disableText,
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
      textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
      iconButtonTheme: AppIconButtonTheme.lightIconButtonTheme,
      appBarTheme: AppAppBarTheme.lightAppBar,
      bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
      chipTheme: AppChipTheme.lightChipTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
      searchBarTheme: AppSearchBarTheme.lightSearchBar,
      colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          brightness: Brightness.light,
          onPrimary: AppColors.primary,
          secondary: AppColors.secondary,
          onSurfaceVariant: AppColors.disableText),
      //iconTheme: const IconThemeData(color: AppColors.dark),
      bottomNavigationBarTheme: AppBottomNavigationTheme.lightBottomNavigationTheme,
      cardTheme: AppCardTheme.lightCardTheme,
      switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.all(AppColors.primary.withAlpha(50)),
          trackOutlineColor: WidgetStateProperty.all(AppColors.primary),
          thumbColor: WidgetStateProperty.all(AppColors.primary)),
      dividerTheme: const DividerThemeData(color: AppColors.grey));

  ///Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.dark,
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
      textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
      iconButtonTheme: AppIconButtonTheme.darkIconButtonTheme,
      appBarTheme: AppAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
      searchBarTheme: AppSearchBarTheme.darkSearchBar,
      colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          brightness: Brightness.dark,
          onPrimary: AppColors.primary,
          secondary: AppColors.secondary,
          onSurfaceVariant: AppColors.disableText),
      iconTheme: const IconThemeData(color: AppColors.white),
      bottomNavigationBarTheme: AppBottomNavigationTheme.darkElevatedButtonTheme,
      cardTheme: AppCardTheme.darkCardTheme,
      switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.all(AppColors.dark),
          trackOutlineColor: WidgetStateProperty.all(AppColors.primary),
          thumbColor: WidgetStateProperty.all(AppColors.primary)),
      dividerTheme: const DividerThemeData(color: AppColors.grey));
// ThemeData
}

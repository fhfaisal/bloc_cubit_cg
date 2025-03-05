
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = AppConstants.fontFamily; // Define your font family here

  static TextTheme lightTextTheme = TextTheme(
    /// Customizable Light Text Theme
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: AppColors.textPrimary),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w700, fontFamily: fontFamily, color: AppColors.textPrimary),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.textPrimary),

    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.textPrimary),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.textPrimary),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.textPrimary),

    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.textPrimary),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.tertiaryText),

    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.textPrimary),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.textPrimary),
    labelSmall: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.tertiaryText),
  ); // TextTheme

  static TextTheme darkTextTheme = TextTheme(
    /// Customizable Dark Text Theme
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: fontFamily, color: AppColors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.white),

    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.white),

    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.tertiaryText),

    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w600, fontFamily: fontFamily, color: AppColors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: AppColors.white),
    labelSmall: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: AppColors.tertiaryText),
  ); // TextTheme
}

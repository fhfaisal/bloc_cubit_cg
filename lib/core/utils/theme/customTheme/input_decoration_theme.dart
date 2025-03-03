import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();
  static const String fontFamily = AppConstants.fontFamily;
  ///Dark InputDecorationTheme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: AppColors.black,
      suffixIconColor: AppColors.black,

// constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.tertiaryText,fontFamily: fontFamily),
      hintStyle: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.tertiaryText,fontFamily: fontFamily),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal,fontFamily: fontFamily),
      floatingLabelStyle: const TextStyle().copyWith(color: AppColors.textPrimary,fontFamily:fontFamily),
      //contentPadding: const EdgeInsets.only(left: 25),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.grey),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.warning,
          )));

  ///Dark InputDecorationTheme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,

// constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.white,fontFamily: fontFamily),
      hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColors.white,fontFamily: fontFamily),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal,fontFamily: fontFamily),
      floatingLabelStyle: const TextStyle().copyWith(color: AppColors.white,fontFamily: fontFamily),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.grey),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.grey),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.white),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: AppColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.warning,
          )));
} // InputDecoration Theme

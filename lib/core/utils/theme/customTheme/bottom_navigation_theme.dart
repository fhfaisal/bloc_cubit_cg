import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class AppBottomNavigationTheme {
  AppBottomNavigationTheme._(); //To avoid creating instances
  static const String fontFamily = AppConstants.fontFamily;
  ///Light Theme
  static final lightBottomNavigationTheme = BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    selectedItemColor: AppColors.primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText,fontFamily: fontFamily),
    unselectedItemColor:AppColors.disableText ,
    selectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary,fontFamily: fontFamily),
  );

  ///DorkTheme
  static final darkElevatedButtonTheme = BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    selectedItemColor: AppColors.primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText,fontFamily: fontFamily),
    unselectedItemColor:AppColors.disableText ,
    selectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary,fontFamily: fontFamily),
  );
}
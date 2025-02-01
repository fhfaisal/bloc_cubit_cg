import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppBottomNavigationTheme {
  AppBottomNavigationTheme._(); //To avoid creating instances

  ///Light Theme
  static final lightBottomNavigationTheme = BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    selectedItemColor: AppColors.primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText),
    unselectedItemColor:AppColors.disableText ,
    selectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary),
  );

  ///DorkTheme
  static final darkElevatedButtonTheme = BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    selectedItemColor: AppColors.primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600,color: AppColors.disableText),
    unselectedItemColor:AppColors.disableText ,
    selectedLabelStyle: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.w600, color: AppColors.primary),
  );
}
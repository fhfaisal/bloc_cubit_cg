import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final _storage = GetStorage();

  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system)) {
    // Load saved theme mode from storage if available.
    final savedThemeIndex = _storage.read('themeMode');
    if (savedThemeIndex != null) {
      emit(ThemeState(themeMode: ThemeMode.values[savedThemeIndex]));
    }
  }

  /// Toggle theme based on the switch value.
  /// If brightness is dark (switch is on), emit dark theme.
  /// Otherwise, emit light theme.
  void toggleTheme({required Brightness brightness}) {
    if (brightness == Brightness.dark) {
      emit(const ThemeState(themeMode: ThemeMode.dark));
      _storage.write('themeMode', ThemeMode.dark.index);
    } else {
      emit(const ThemeState(themeMode: ThemeMode.light));
      _storage.write('themeMode', ThemeMode.light.index);
    }
  }

  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m4_user/core/constants/app_constants.dart';
import 'package:m4_user/core/services/logger_service.dart';
import 'package:m4_user/core/services/storage_service.dart';


/// Controls app theme (light/dark/system) with persistence
class ThemeController extends GetxController {
  // ─── Observable State ─────────────────────────────────────────────────────────
  final _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode {
    if (_themeMode.value == ThemeMode.system) {
      return Get.isPlatformDarkMode;
    }
    return _themeMode.value == ThemeMode.dark;
  }

  // ─── Lifecycle ────────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  // ─── Methods ─────────────────────────────────────────────────────────────────

  /// Load saved theme preference from storage
  void _loadTheme() {
    final saved = StorageService.getString(AppConstants.keyThemeMode);
    if (saved != null) {
      _themeMode.value = _themeModeFromString(saved);
      AppLogger.i('Theme loaded: $saved');
    }
  }

  /// Toggle between light and dark theme
  void toggleTheme() {
    if (isDarkMode) {
      setTheme(ThemeMode.light);
    } else {
      setTheme(ThemeMode.dark);
    }
  }

  /// Set a specific theme mode
  void setTheme(ThemeMode mode) {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
    StorageService.setString(AppConstants.keyThemeMode, mode.name);
    AppLogger.i('Theme changed to: ${mode.name}');
  }

  /// Set theme to follow system setting
  void setSystemTheme() => setTheme(ThemeMode.system);

  /// Set light theme
  void setLightTheme() => setTheme(ThemeMode.light);

  /// Set dark theme
  void setDarkTheme() => setTheme(ThemeMode.dark);

  // ─── Helpers ─────────────────────────────────────────────────────────────────
  ThemeMode _themeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}

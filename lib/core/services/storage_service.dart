import 'package:shared_preferences/shared_preferences.dart';
import '../services/logger_service.dart';

/// Service for persisting app preferences using SharedPreferences
class StorageService {
  StorageService._();

  static SharedPreferences? _prefs;

  /// Initialize the storage service. Must be called before use.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    AppLogger.i('StorageService initialized');
  }

  // ─── Generic Methods ─────────────────────────────────────────────────────────

  static Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  static Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  static Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }

  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}

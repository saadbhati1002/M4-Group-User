import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class CacheService {
  static const String appBox = 'app_cache';

  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    await Hive.openBox(appBox);
  }

  static Future<void> cacheData(String key, dynamic value) async {
    final box = Hive.box(appBox);
    await box.put(key, value);
  }

  static dynamic getData(String key) {
    final box = Hive.box(appBox);
    return box.get(key);
  }

  static Future<void> clearCache() async {
    final box = Hive.box(appBox);
    await box.clear();
  }
}

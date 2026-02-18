import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/routes/app_routes.dart';
import 'core/services/storage_service.dart';
import 'core/services/logger_service.dart';
import 'core/theme/app_theme.dart';
import 'presentation/controllers/theme_controller.dart';
import 'presentation/bindings/app_binding.dart';

/// Entry point for M4 Group Flutter Application
void main() async {
  // Ensure Flutter bindings are initialized before any async operations
  WidgetsFlutterBinding.ensureInitialized();

  // ─── System UI Configuration ───────────────────────────────────────────────
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  // Lock to portrait mode for consistent UX
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ─── Initialize Services ───────────────────────────────────────────────────
  await StorageService.init();
  AppLogger.i('M4 Group App Starting...');

  // ─── Initialize App Binding ────────────────────────────────────────────────
  AppBinding().dependencies();

  runApp(const M4GroupApp());
}

/// Root application widget
class M4GroupApp extends StatelessWidget {
  const M4GroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();

    return Obx(() {
      return GetMaterialApp(
        // ─── App Identity ──────────────────────────────────────────────────
        title: 'M4 Group',
        debugShowCheckedModeBanner: false,

        // ─── Theme ─────────────────────────────────────────────────────────
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeCtrl.themeMode,

        // ─── Navigation ────────────────────────────────────────────────────
        initialRoute: AppRoutes.initial,
        getPages: AppRoutes.pages,
        defaultTransition: Transition.fadeIn,

        // ─── Locale ────────────────────────────────────────────────────────
        locale: const Locale('en', 'IN'),
        fallbackLocale: const Locale('en', 'US'),

        // ─── Builder ───────────────────────────────────────────────────────
        builder: (context, child) {
          // Apply edge-to-edge rendering
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          );
        },
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/services/cache_service.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  runApp(
    const ProviderScope(
      child: M4GroupApp(),
    ),
  );
}

class M4GroupApp extends StatelessWidget {
  const M4GroupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'M4 Group',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}

import 'package:get/get.dart';
import 'package:m4_user/presentation/screens/home_screen.dart';
import 'package:m4_user/presentation/bindings/home_binding.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/webview_screen.dart';
import '../../presentation/screens/no_internet_screen.dart';
import '../../presentation/screens/error_screen.dart';
import '../../presentation/bindings/app_binding.dart';

/// Centralized route management using GetX named routes
class AppRoutes {
  AppRoutes._();

  // Route names
  static const String splash = '/splash';
  static const String home = '/home';
  static const String webview = '/webview';
  static const String noInternet = '/no-internet';
  static const String error = '/error';

  // Initial route
  static const String initial = splash;

  /// GetX pages list
  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: AppBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: webview,
      page: () => const WebViewScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: noInternet,
      page: () => const NoInternetScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: error,
      page: () => const ErrorScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

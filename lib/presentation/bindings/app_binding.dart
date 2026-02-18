import 'package:get/get.dart';
import 'package:m4_user/core/services/api_service.dart';
import 'package:m4_user/presentation/controllers/theme_controller.dart';
import 'package:m4_user/presentation/controllers/connectivity_controller.dart';
import 'package:m4_user/presentation/controllers/webview_controller.dart';

/// Root binding - initializes all global controllers at app startup
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(), permanent: true);

    Get.put<ThemeController>(
      ThemeController(),
      permanent: true,
    );

    Get.put<ConnectivityController>(
      ConnectivityController(),
      permanent: true,
    );

    Get.put<AppWebViewController>(
      AppWebViewController(),
      permanent: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/webview_controller.dart';
import '../controllers/theme_controller.dart';
import '../controllers/connectivity_controller.dart';
import '../widgets/webview_progress_bar.dart';
import '../widgets/webview_error_widget.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';

/// Main WebView screen - the primary content screen of the app
class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final webCtrl = Get.find<AppWebViewController>();
    final themeCtrl = Get.find<ThemeController>();
    final connectCtrl = Get.find<ConnectivityController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await webCtrl.handleBackButton();
        if (shouldExit && context.mounted) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: _buildAppBar(context, themeCtrl, webCtrl),
        body: Obx(() {
          // Show no-internet if offline
          if (!connectCtrl.isConnected) {
            return _buildOfflineWidget(context, connectCtrl);
          }

          return Stack(
            children: [
              // ─── WebView with Pull-to-Refresh ────────────────────────────
              LayoutBuilder(
                builder: (context, constraints) {
                  return RefreshIndicator(
                    onRefresh: webCtrl.reload,
                    color: AppColors.primary,
                    backgroundColor: Theme.of(context).cardColor,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: WebViewWidget(
                            controller: webCtrl.webViewController),
                      ),
                    ),
                  );
                },
              ),

              // ─── Progress Bar ─────────────────────────────────────────────
              Obx(() {
                if (webCtrl.isLoading) {
                  return WebViewProgressBar(
                    progress: webCtrl.loadingProgress / 100.0,
                  );
                }
                return const SizedBox.shrink();
              }),

              // ─── Error Overlay ────────────────────────────────────────────
              Obx(() {
                if (webCtrl.hasError) {
                  return WebViewErrorWidget(
                    message: webCtrl.errorMessage,
                    onRetry: webCtrl.reload,
                    onGoHome: webCtrl.goHome,
                  );
                }
                return const SizedBox.shrink();
              }),

              // ─── Initial Loader ───────────────────────────────────────────
              Obx(() {
                if (webCtrl.isLoading && !webCtrl.isPageLoaded) {
                  return _buildInitialLoader(context);
                }
                return const SizedBox.shrink();
              }),
            ],
          );
        }),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ThemeController themeCtrl,
    AppWebViewController webCtrl,
  ) {
    return AppBar(
      leading: Obx(() {
        if (webCtrl.canGoBack) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            onPressed: () async {
              await webCtrl.webViewController.goBack();
            },
            tooltip: 'Go Back',
          );
        }
        return const SizedBox.shrink();
      }),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Center(
              child: Text(
                'M4',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            AppConstants.appName,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        // Theme toggle
        Obx(() {
          return IconButton(
            icon: Icon(
              themeCtrl.isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              size: 22,
            ),
            onPressed: themeCtrl.toggleTheme,
            tooltip: themeCtrl.isDarkMode ? 'Light Mode' : 'Dark Mode',
          );
        }),

        // Reload button
        IconButton(
          icon: const Icon(Icons.refresh_rounded, size: 22),
          onPressed: webCtrl.reload,
          tooltip: 'Reload',
        ),

        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildInitialLoader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'M4',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Loading M4 Group...',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineWidget(
    BuildContext context,
    ConnectivityController connectCtrl,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 72,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              const SizedBox(height: 24),
              Text(
                'No Internet Connection',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Please check your network settings and try again.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: connectCtrl.checkConnectivity,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

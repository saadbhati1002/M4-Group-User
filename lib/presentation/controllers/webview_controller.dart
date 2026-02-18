import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';

import '../../core/services/logger_service.dart';

/// Controls WebView state, navigation, and lifecycle
class AppWebViewController extends GetxController {
  // ─── WebView Controller ───────────────────────────────────────────────────────
  late final WebViewController webViewController;

  // ─── Observable State ─────────────────────────────────────────────────────────
  final _isLoading = true.obs;
  final _loadingProgress = 0.obs;
  final _canGoBack = false.obs;
  final _currentUrl = AppConstants.baseUrl.obs;
  final _hasError = false.obs;
  final _errorMessage = ''.obs;
  final _isPageLoaded = false.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  int get loadingProgress => _loadingProgress.value;
  bool get canGoBack => _canGoBack.value;
  String get currentUrl => _currentUrl.value;
  bool get hasError => _hasError.value;
  String get errorMessage => _errorMessage.value;
  bool get isPageLoaded => _isPageLoaded.value;

  // ─── Lifecycle ────────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    _initWebViewController();
  }

  // ─── Initialization ───────────────────────────────────────────────────────────

  void _initWebViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(_buildNavigationDelegate())
      ..enableZoom(false)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36 '
        'M4GroupApp/1.0',
      )
      ..loadRequest(Uri.parse(AppConstants.baseUrl));

    AppLogger.webview('Initialized', AppConstants.baseUrl);
  }

  NavigationDelegate _buildNavigationDelegate() {
    return NavigationDelegate(
      onPageStarted: _onPageStarted,
      onPageFinished: _onPageFinished,
      onProgress: _onProgress,
      onWebResourceError: _onWebResourceError,
      onNavigationRequest: _onNavigationRequest,
    );
  }

  // ─── Navigation Delegate Handlers ────────────────────────────────────────────

  void _onPageStarted(String url) {
    _isLoading.value = true;
    _hasError.value = false;
    _isPageLoaded.value = false;
    _currentUrl.value = url;
    AppLogger.webview('PageStarted', url);
  }

  void _onPageFinished(String url) {
    _isLoading.value = false;
    _isPageLoaded.value = true;
    _currentUrl.value = url;
    _updateCanGoBack();
    AppLogger.webview('PageFinished', url);
  }

  void _onProgress(int progress) {
    _loadingProgress.value = progress;
  }

  void _onWebResourceError(WebResourceError error) {
    // Only show error for main frame errors, not sub-resource errors
    if (error.isForMainFrame ?? true) {
      _isLoading.value = false;
      _hasError.value = true;
      _errorMessage.value = _getErrorMessage(error);
      AppLogger.e(
        'WebView error: ${error.description}',
        'Code: ${error.errorCode}',
      );
    }
  }

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    final url = request.url;
    AppLogger.webview('NavigationRequest', url);

    // Handle external URL schemes (tel, mailto, whatsapp, etc.)
    for (final pattern in AppConstants.externalUrlPatterns) {
      if (url.startsWith(pattern)) {
        _launchExternalUrl(url);
        return NavigationDecision.prevent;
      }
    }

    // Handle payment gateway redirects (allow within webview)
    for (final domain in AppConstants.paymentDomains) {
      if (url.contains(domain)) {
        AppLogger.webview('PaymentRedirect', url);
        return NavigationDecision.navigate;
      }
    }

    // Allow all m4group.in URLs
    if (url.contains('m4group.in')) {
      return NavigationDecision.navigate;
    }

    // For truly external URLs, open in browser
    if (url.startsWith('http') && !url.contains('m4group.in')) {
      _launchExternalUrl(url);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  // ─── Public Methods ───────────────────────────────────────────────────────────

  /// Handle Android back button press
  Future<bool> handleBackButton() async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
      return false; // Don't exit app
    }
    return true; // Exit app
  }

  /// Reload the current page (returns Future for RefreshIndicator)
  Future<void> reload() async {
    _hasError.value = false;
    await webViewController.reload();
    AppLogger.webview('Reload', _currentUrl.value);
  }

  /// Clear WebView cache
  Future<void> clearCache() async {
    await webViewController.clearCache();
    AppLogger.webview('Cache Cleared', _currentUrl.value);
  }

  /// Load a specific URL
  Future<void> loadUrl(String url) async {
    _hasError.value = false;
    await webViewController.loadRequest(Uri.parse(url));
    AppLogger.webview('LoadUrl', url);
  }

  /// Navigate to home URL
  Future<void> goHome() async {
    await loadUrl(AppConstants.baseUrl);
  }

  /// Update can-go-back state
  Future<void> _updateCanGoBack() async {
    _canGoBack.value = await webViewController.canGoBack();
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────────

  Future<void> _launchExternalUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        AppLogger.webview('ExternalLaunch', url);
      }
    } catch (e) {
      AppLogger.e('Failed to launch external URL: $url', e);
    }
  }

  String _getErrorMessage(WebResourceError error) {
    switch (error.errorCode) {
      case -2:
        return 'No internet connection. Please check your network.';
      case -6:
        return 'Connection timed out. Please try again.';
      case -7:
        return 'Connection refused by server.';
      case -8:
        return 'Connection reset. Please try again.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}

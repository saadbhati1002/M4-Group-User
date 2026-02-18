import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../core/services/logger_service.dart';

/// Monitors network connectivity and navigates to no-internet screen when offline.
class ConnectivityController extends GetxController {
  // ─── Dependencies ─────────────────────────────────────────────────────────────
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  // ─── Observable State ─────────────────────────────────────────────────────────
  final _isConnected = true.obs;
  final _connectionType = ConnectivityResult.none.obs;

  bool get isConnected => _isConnected.value;
  ConnectivityResult get connectionType => _connectionType.value;

  // ─── Lifecycle ────────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _listenToConnectivity();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  // ─── Methods ─────────────────────────────────────────────────────────────────

  /// Check initial connectivity status
  Future<void> _initConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectivity(results);
    } catch (e) {
      AppLogger.e('Failed to check connectivity', e);
    }
  }

  /// Listen to connectivity changes
  void _listenToConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectivity,
      onError: (e) => AppLogger.e('Connectivity stream error', e),
    );
  }

  /// Update state based on connectivity results
  void _updateConnectivity(List<ConnectivityResult> results) {
    final hasConnection = results.any(
      (r) => r != ConnectivityResult.none,
    );

    final previouslyConnected = _isConnected.value;
    _isConnected.value = hasConnection;

    if (results.isNotEmpty) {
      _connectionType.value = results.first;
    }

    AppLogger.connectivity(hasConnection ? 'Online' : 'Offline');

    // Navigate based on connectivity change
    if (!hasConnection && previouslyConnected) {
      // Just went offline
      if (Get.currentRoute != AppRoutes.noInternet) {
        Get.toNamed(AppRoutes.noInternet);
      }
    } else if (hasConnection && !previouslyConnected) {
      // Just came back online
      if (Get.currentRoute == AppRoutes.noInternet) {
        Get.back();
      }
    }
  }

  /// Manual connectivity check (e.g., on retry button press)
  Future<bool> checkConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectivity(results);
      return _isConnected.value;
    } catch (e) {
      AppLogger.e('Manual connectivity check failed', e);
      return false;
    }
  }
}

/// Application-wide constants for M4 Group WebView App
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'M4 Group';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.m4group.user';

  // WebView URL
  static const String baseUrl = 'https://m4group.in/';
  static const String apiBaseUrl = 'https://admin.m4group.in/api';
  static const String privacyPolicyUrl = '${baseUrl}privacy-policy';
  static const String termsUrl = 'https://m4group.in/terms';

  // Timeouts & Durations
  static const int connectionTimeout = 30;
  static const int receiveTimeout = 30;
  static const Duration splashDuration = Duration(milliseconds: 2500);
  static const int splashDurationMs = 2500;

  // External URL patterns (open in browser)
  static const List<String> externalUrlPatterns = [
    'tel:',
    'mailto:',
    'whatsapp://',
    'upi://',
    'intent://',
    'market://',
  ];

  // Payment gateway domains (handle specially)
  static const List<String> paymentDomains = [
    'razorpay.com',
    'payu.in',
    'ccavenue.com',
    'paytm.com',
    'phonepe.com',
    'stripe.com',
  ];

  // Deep link scheme
  static const String deepLinkScheme = 'm4group';
  static const String deepLinkHost = 'app';

  // Timeouts
  static const int webViewTimeoutSeconds = 30;
  static const int connectivityCheckIntervalSeconds = 5;

  // SharedPreferences keys
  static const String keyThemeMode = 'theme_mode';
  static const String keyFirstLaunch = 'first_launch';

  // Animation durations
  static const int animationFastMs = 200;
  static const int animationNormalMs = 350;
}

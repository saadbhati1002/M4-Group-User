import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Animated progress bar shown at the top of the WebView during page loading
class WebViewProgressBar extends StatelessWidget {
  final double progress;

  const WebViewProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: progress < 1.0 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.transparent,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 3,
        ),
      ),
    );
  }
}

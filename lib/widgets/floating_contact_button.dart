import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';

class FloatingContactButton extends StatefulWidget {
  const FloatingContactButton({super.key});

  @override
  State<FloatingContactButton> createState() => _FloatingContactButtonState();
}

class _FloatingContactButtonState extends State<FloatingContactButton>
    with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  void _toggle() {
    setState(() => _isOpened = !_isOpened);
    if (_isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizeTransition(
          sizeFactor: _expandAnimation,
          child: Column(
            children: [
              _buildAction(
                  Icons.call, () => launchUrl(Uri.parse('tel:+912212345678'))),
              const SizedBox(height: 10),
              _buildAction(
                  Icons.message,
                  () => launchUrl(
                      Uri.parse('whatsapp://send?phone=+911234567890'))),
              const SizedBox(height: 10),
              _buildAction(Icons.email,
                  () => launchUrl(Uri.parse('mailto:info@m4group.in'))),
              const SizedBox(height: 15),
            ],
          ),
        ),
        GestureDetector(
          onTap: _toggle,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryGold.withValues(alpha: 0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              _isOpened ? Icons.close : Icons.support_agent,
              color: AppTheme.luxuryBlack,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAction(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppTheme.secondaryBlack,
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.primaryGold, width: 1),
        ),
        child: Icon(icon, color: AppTheme.primaryGold, size: 22),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

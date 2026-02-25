import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class LuxuryContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isPressed;
  final Color? color;

  const LuxuryContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius = 22,
    this.padding,
    this.margin,
    this.isPressed = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: AppTheme.skeuomorphicDecoration(
        radius: radius,
        color: color ?? AppTheme.secondaryBlack,
        isPressed: isPressed,
      ),
      child: child,
    );
  }
}

class GoldButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const GoldButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.goldGradient,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryGold.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppTheme.luxuryBlack, size: 20),
              const SizedBox(width: 10),
            ],
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: AppTheme.luxuryBlack,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LuxuryTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const LuxuryTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.skeuomorphicDecoration(radius: 15, isPressed: true),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: AppTheme.softGrey),
          icon: Icon(icon, color: AppTheme.primaryGold),
        ),
      ),
    );
  }
}

class GoldDivider extends StatelessWidget {
  const GoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppTheme.primaryGold,
            Colors.transparent
          ],
        ),
      ),
    );
  }
}

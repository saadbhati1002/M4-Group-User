import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppConstants
            .home); // Skip onboarding for now or route there if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(seconds: 2),
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryGold.withValues(alpha: 0.2),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(Icons.apartment_rounded,
                    size: 100, color: AppTheme.primaryGold),
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              duration: const Duration(seconds: 2),
              child: Column(
                children: [
                  Text(
                    'M4 GROUP',
                    style:
                        AppTheme.luxuryTheme.textTheme.displayLarge?.copyWith(
                      letterSpacing: 4,
                      color: AppTheme.primaryGold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'DEFINING LUXURY SINCE 1994',
                    style: TextStyle(
                      color: AppTheme.softGrey,
                      letterSpacing: 2,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

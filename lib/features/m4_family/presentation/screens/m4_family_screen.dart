import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_drawer.dart';
import '../widgets/m4_family_widgets.dart';

class M4FamilyScreen extends StatelessWidget {
  const M4FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      drawer: const LuxuryDrawer(),
      body: const CustomScrollView(
        slivers: [
          // Hero Collage
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: M4FamilyHeroSection(),
            ),
          ),
          // Logo Section
          SliverToBoxAdapter(
            child: M4FamilyLogoSection(),
          ),
          // Lifestyle Grid
          SliverToBoxAdapter(
            child: LifestyleGridSection(),
          ),
        ],
      ),
    );
  }
}

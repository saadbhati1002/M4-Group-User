import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class CareerScreen extends StatelessWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('CAREER OPPORTUNITIES')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FadeInDown(
              child: const LuxuryContainer(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      'JOIN THE M4 LEGACY',
                      style: TextStyle(
                          color: AppTheme.primaryGold,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We are looking for visionary minds to shape the future of luxury real estate.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppTheme.softGrey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildJobCard('Senior Architect', 'Mumbai', '10+ Years Experience'),
            const SizedBox(height: 20),
            _buildJobCard('Project Manager', 'Lonavala', '8+ Years Experience'),
            const SizedBox(height: 20),
            _buildJobCard(
                'Luxury Sales Consultant', 'Mumbai', '5+ Years Experience'),
            const SizedBox(height: 40),
            GoldButton(
              label: 'General Application',
              onPressed: () {},
              icon: Icons.send_rounded,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(String title, String loc, String exp) {
    return FadeInUp(
      child: LuxuryContainer(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(loc,
                      style: const TextStyle(
                          color: AppTheme.softGrey, fontSize: 13)),
                  const SizedBox(height: 5),
                  Text(exp,
                      style: const TextStyle(
                          color: AppTheme.primaryGold,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            GoldButton(
              label: 'Apply',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('OUR PHILOSOPHY')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FadeInDown(
              child: LuxuryContainer(
                radius: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FadeInUp(
              child: LuxuryContainer(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      'ESTABLISHED 1994',
                      style: AppTheme.luxuryTheme.textTheme.titleLarge
                          ?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              'OUR VISION',
              'To be the most trusted and innovative global leader in luxury infrastructure and premium lifestyle development.',
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              'OUR MISSION',
              'Delivering uncompromising quality and timeless architecture through sustainable practices and visionary engineering.',
            ),
            const SizedBox(height: 30),
            const GoldDivider(),
            const SizedBox(height: 30),
            const Text(
              'CORE VALUES',
              style: TextStyle(
                  color: AppTheme.primaryGold,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            const SizedBox(height: 20),
            _buildValueRow(
                'Integrity', 'Unwavering commitment to ethical standards.'),
            _buildValueRow(
                'Excellence', 'Striving for perfection in every detail.'),
            _buildValueRow('Innovation',
                'Pushing boundaries with forward-thinking design.'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return FadeInUp(
      child: LuxuryContainer(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppTheme.primaryGold,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                  color: AppTheme.softGrey, fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueRow(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline_rounded,
              color: AppTheme.primaryGold, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: AppTheme.white, fontWeight: FontWeight.bold)),
                Text(desc,
                    style: const TextStyle(
                        color: AppTheme.softGrey, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

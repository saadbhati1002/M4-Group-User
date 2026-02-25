import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/glass_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
        backgroundColor: AppTheme.charcoal,
        foregroundColor: AppTheme.primaryGold,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FadeInDown(
              child: const Icon(Icons.history_edu,
                  size: 80, color: AppTheme.primaryGold),
            ),
            const SizedBox(height: 20),
            FadeInUp(
              child: Text(
                'OUR LEGACY',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.primaryGold,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            GlassCard(
              child: Text(
                'M4 Group stands at the forefront of innovation and luxury. With decades of experience in the real estate sector, we have consistently delivered landmark projects that redefine urban living. Our commitment to quality, transparency, and architectural excellence makes us a trusted name in the industry.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoTile(context, 'MISSION',
                'To craft timeless residences that offer unparalleled luxury and comfort.'),
            const SizedBox(height: 15),
            _buildInfoTile(context, 'VISION',
                'To be the most preferred luxury real estate developer in India by 2030.'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
      BuildContext context, String title, String description) {
    return FadeInLeft(
      child: GlassCard(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.primaryGold,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

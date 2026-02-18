import 'package:flutter/material.dart';
import 'package:m4_user/core/theme/app_colors.dart';
import 'package:m4_user/core/theme/app_text_styles.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      _FeatureItem(
        icon: Icons.data_usage,
        title: 'Flexible Data Plans',
        description:
            'Get cellular data that works for your budget and itinerary.',
        color: Colors.blue,
      ),
      _FeatureItem(
        icon: Icons.settings,
        title: 'Simple Setup',
        description:
            'Download the app, install the eSIM, and connect instantly.',
        color: Colors.green,
      ),
      _FeatureItem(
        icon: Icons.lock_clock,
        title: 'No Hidden Costs',
        description:
            'Avoid costly roaming fees with transparent upfront pricing.',
        color: Colors.red,
      ),
      _FeatureItem(
        icon: Icons.refresh,
        title: 'Reusable eSIM',
        description: 'Add new destinations to your existing eSIM easily.',
        color: Colors.orange,
      ),
      _FeatureItem(
        icon: Icons.notifications_active,
        title: 'Smart Usage Alerts',
        description: 'We\'ll notify you when you\'ve used 80% of your plan.',
        color: Colors.purple,
      ),
      _FeatureItem(
        icon: Icons.public,
        title: 'Worldwide Coverage',
        description: 'Stay online in 180+ countries with global data plans.',
        color: Colors.teal,
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.primaryGradient),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Why choose us?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Stay connected while traveling',
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final feature = features[index];
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: feature.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(feature.icon, color: feature.color),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      feature.title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      feature.description,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

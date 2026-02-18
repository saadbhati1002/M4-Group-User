import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m4_user/core/theme/app_colors.dart';
import 'package:m4_user/core/theme/app_text_styles.dart';
import 'package:m4_user/presentation/controllers/home_controller.dart';
import 'package:m4_user/presentation/widgets/home/plan_card.dart';

class PopularPlansSection extends GetView<HomeController> {
  const PopularPlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular eSIMs',
                    style: AppTextStyles.headlineSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Choose from our best value plans',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {}, // Navigate to all packages
                child: const Row(
                  children: [
                    Text('View All'),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.popularPackages.isEmpty) {
              return const SizedBox.shrink();
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.popularPackages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final package = controller.popularPackages[index];
                return PlanCard(package: package);
              },
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m4_user/presentation/controllers/home_controller.dart';
import 'package:m4_user/presentation/widgets/home/hero_section.dart';
import 'package:m4_user/presentation/widgets/home/why_choose_section.dart';
import 'package:m4_user/presentation/widgets/home/popular_plans_section.dart';
import 'package:m4_user/presentation/widgets/home/faq_section.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: controller.fetchHomeData,
        child: CustomScrollView(
          slivers: [
            const HeroSection(),
            const SliverToBoxAdapter(child: WhyChooseSection()),
            const SliverToBoxAdapter(child: PopularPlansSection()),
            const SliverToBoxAdapter(child: FAQSection()),
            const SliverToBoxAdapter(
              child: SizedBox(height: 50), // Bottom padding
            ),
          ],
        ),
      ),
    );
  }
}

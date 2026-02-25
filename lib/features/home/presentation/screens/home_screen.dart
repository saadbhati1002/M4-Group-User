import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/parallax_hero_slider.dart';
import '../../../../widgets/floating_contact_button.dart';

import '../../../../widgets/luxury_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const ParallaxHeroSlider(
                  images: [
                    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=2070',
                    'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069',
                    'https://images.unsplash.com/photo-1541888946425-d81bb19480c5?q=80&w=2070',
                  ],
                ),
                const SizedBox(height: 30),
                _buildAboutSection(context),
                const SizedBox(height: 40),
                _buildSectionTitle(context, 'Business Verticals'),
                _buildBusinessVerticals(context),
                const SizedBox(height: 40),
                _buildSectionTitle(context, 'Featured Ventures'),
                _buildVenturesList(context),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingContactButton(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 80,
      backgroundColor: AppTheme.luxuryBlack,
      surfaceTintColor: Colors.transparent,
      title: Text(
        'M4 GROUP',
        style: AppTheme.luxuryTheme.textTheme.titleLarge,
      ),
      actions: [
        IconButton(
          onPressed: () => context.push(AppConstants.projects),
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: AppTheme.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FadeInUp(
        child: LuxuryContainer(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                'A LEGACY OF EXCELLENCE',
                style: TextStyle(
                    color: AppTheme.primaryGold,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              const SizedBox(height: 15),
              const Text(
                'Designing the future of luxury real estate, construction and lifestyle ventures across the globe.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.softGrey, fontSize: 15),
              ),
              const SizedBox(height: 20),
              GoldButton(
                label: 'Our Story',
                onPressed: () => context.push(AppConstants.about),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessVerticals(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _buildVerticalCard(context, 'Real Estate', Icons.home_work_rounded),
          _buildVerticalCard(
              context, 'Construction', Icons.architecture_rounded),
          _buildVerticalCard(context, 'Luxury Villas', Icons.villa_rounded),
        ],
      ),
    );
  }

  Widget _buildVerticalCard(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LuxuryContainer(
        radius: 20,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppTheme.primaryGold, size: 35),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                  color: AppTheme.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVenturesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildVentureCard(context, 'M4 Aura Heights', 'Grant Road, Mumbai',
              'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?q=80&w=1935'),
          const SizedBox(height: 20),
          _buildVentureCard(context, 'Eu4ria Villas', 'Lonavala',
              'https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=2071'),
        ],
      ),
    );
  }

  Widget _buildVentureCard(
      BuildContext context, String title, String loc, String img) {
    return FadeInLeft(
      child: LuxuryContainer(
        padding: EdgeInsets.zero,
        child: InkWell(
          onTap: () => context.push(AppConstants.projects),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22)),
                child: Image.network(img,
                    width: 120, height: 120, fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
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
                      const SizedBox(height: 10),
                      const Text('VIEW DETAILS',
                          style: TextStyle(
                              color: AppTheme.primaryGold,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.chevron_right_rounded,
                    color: AppTheme.primaryGold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../widgets/floating_contact_button.dart';
import '../../../../widgets/luxury_drawer.dart';
import '../widgets/home_sections.dart';
import '../../../../data/models/home_models.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeDataAsync = ref.watch(homeDataProvider);

    return Scaffold(
      drawer: const LuxuryDrawer(),
      body: homeDataAsync.when(
        data: (data) => _buildHomeContent(context, data),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppTheme.primaryGold),
        ),
        error: (err, stack) => Center(
          child: Text('Error loading luxury content',
              style: TextStyle(color: Colors.red)),
        ),
      ),
      floatingActionButton: const FloatingContactButton(),
    );
  }

  Widget _buildHomeContent(BuildContext context, Map<String, dynamic> data) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(context),
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeHeroSection(data: HomeBannerModel.fromJson(data['hero'])),
              const SizedBox(height: 40),
              _buildAboutSection(data['about']),
              const SizedBox(height: 50),
              HomeBusinessSection(
                businesses: (data['businesses'] as List)
                    .map((e) => BusinessModel.fromJson(e))
                    .toList(),
              ),
              const SizedBox(height: 50),
              HomeProjectsSection(
                projects: (data['projects'] as List)
                    .map((e) => ProjectPreviewModel.fromJson(e))
                    .toList(),
              ),
              const SizedBox(height: 50),
              HomeVisionSection(
                title: data['vision']['title'],
                content: data['vision']['content'],
              ),
              const SizedBox(height: 30),
              HomeVisionSection(
                title: data['mission']['title'],
                content: data['mission']['content'],
              ),
              const SizedBox(height: 50),
              HomeBlogSection(
                blogs: (data['blogs'] as List)
                    .map((e) => BlogPreviewModel.fromJson(e))
                    .toList(),
              ),
              const SizedBox(height: 60),
              HomeFooterCtaSection(
                title: data['footerCta']['title'],
                ctaText: data['footerCta']['ctaText'],
              ),
            ],
          ),
        ),
      ],
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
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }

  Widget _buildAboutSection(Map<String, dynamic> aboutData) {
    return HomeAboutSection(
      title: aboutData['title'],
      description: aboutData['description'],
      imageUrl: aboutData['imageUrl'],
    );
  }
}

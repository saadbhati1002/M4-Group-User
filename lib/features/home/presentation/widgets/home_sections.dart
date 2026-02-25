import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../data/models/home_models.dart';

class HomeHeroSection extends StatelessWidget {
  final HomeBannerModel data;
  const HomeHeroSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Stack(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data.imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppTheme.luxuryBlack.withValues(alpha: 0.8),
                  AppTheme.luxuryBlack,
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    delay: const Duration(milliseconds: 300),
                    child: Text(
                      data.title,
                      style: AppTheme.luxuryTheme.textTheme.displayMedium
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 500),
                    child: Text(
                      data.subtitle,
                      style: const TextStyle(
                        color: AppTheme.softGrey,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: GoldButton(
                      label: data.ctaText,
                      onPressed: () => context.push(AppConstants.contact),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAboutSection extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const HomeAboutSection({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FadeInDown(
            child: LuxuryContainer(
              padding: EdgeInsets.zero,
              radius: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          FadeInUp(
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppTheme.primaryGold,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppTheme.softGrey,
                    height: 1.6,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () => context.push(AppConstants.about),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'READ MORE',
                        style: TextStyle(
                          color: AppTheme.primaryGold,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_right_alt, color: AppTheme.primaryGold),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBusinessSection extends StatelessWidget {
  final List<BusinessModel> businesses;
  const HomeBusinessSection({super.key, required this.businesses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader('OUR BUSINESS'),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: businesses.length,
            itemBuilder: (context, index) {
              final business = businesses[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: LuxuryContainer(
                  width: 250,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(_getIcon(business.icon),
                          color: AppTheme.primaryGold, size: 30),
                      const SizedBox(height: 15),
                      Text(
                        business.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        business.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppTheme.softGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'business_outlined':
        return Icons.business_outlined;
      case 'architecture_outlined':
        return Icons.architecture_outlined;
      case 'villa_outlined':
        return Icons.villa_outlined;
      default:
        return Icons.star_outline;
    }
  }

  Widget _buildSectionHeader(String title) {
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
            title,
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
}

class HomeProjectsSection extends StatelessWidget {
  final List<ProjectPreviewModel> projects;
  const HomeProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader('FEATURED PROJECTS'),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: projects
                .map((project) => _buildProjectCard(context, project))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectPreviewModel project) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: FadeInUp(
        child: LuxuryContainer(
          padding: EdgeInsets.zero,
          child: InkWell(
            onTap: () => context.push(AppConstants.projects),
            child: Column(children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(18)),
                child: Image.network(
                  project.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            project.location,
                            style: const TextStyle(
                                color: AppTheme.softGrey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryGold),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        project.status,
                        style: const TextStyle(
                          color: AppTheme.primaryGold,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // Reuse header builder
  Widget _buildSectionHeader(String title) {
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
            title,
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
}

class HomeVisionSection extends StatelessWidget {
  final String title;
  final String content;

  const HomeVisionSection(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FadeIn(
        child: LuxuryContainer(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Icon(Icons.remove_red_eye_outlined,
                  color: AppTheme.primaryGold, size: 40),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.primaryGold,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.softGrey,
                  height: 1.6,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBlogSection extends StatelessWidget {
  final List<BlogPreviewModel> blogs;
  const HomeBlogSection({super.key, required this.blogs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader('INSIGHTS & NEWS'),
        const SizedBox(height: 20),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: LuxuryContainer(
                  width: 280,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18)),
                        child: Image.network(
                          blog.imageUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog.date,
                              style: const TextStyle(
                                  color: AppTheme.primaryGold, fontSize: 10),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              blog.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
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
            title,
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
}

class HomeFooterCtaSection extends StatelessWidget {
  final String title;
  final String ctaText;

  const HomeFooterCtaSection(
      {super.key, required this.title, required this.ctaText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 30),
          GoldButton(
            label: ctaText,
            onPressed: () => context.push(AppConstants.contact),
          ),
        ],
      ),
    );
  }
}

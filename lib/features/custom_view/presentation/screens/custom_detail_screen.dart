import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/customization_model.dart';

class CustomDetailScreen extends StatelessWidget {
  final CustomizationCategory category;

  const CustomDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      body: CustomScrollView(
        slivers: [
          // Simplified Hero
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: AppTheme.luxuryBlack,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                category.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.luxuryBlack.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: AppTheme.primaryGold),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Content
          const SliverPadding(
            padding: EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Options',
                    style: TextStyle(
                      color: AppTheme.primaryGold,
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Explore our range of premium customization options for your personalized home experience.',
                    style: TextStyle(
                      color: AppTheme.softGrey,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Placeholder for actual items
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    height: 100,
                    decoration: AppTheme.skeuomorphicDecoration(
                      radius: 16,
                      color: AppTheme.secondaryBlack,
                    ),
                    child: Center(
                      child: Text(
                        'Option ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

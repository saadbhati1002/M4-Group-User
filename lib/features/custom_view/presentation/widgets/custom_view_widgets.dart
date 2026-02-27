import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/customization_model.dart';
import '../../../../widgets/luxury_widgets.dart';

class CustomHeroSection extends StatelessWidget {
  final double scrollOffset;

  const CustomHeroSection({super.key, this.scrollOffset = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Stack(
          children: [
            // Background Image with Parallax
            Transform.translate(
              offset: Offset(0, scrollOffset * 0.5),
              child: Image.network(
                'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?q=80&w=1470&auto=format&fit=crop',
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            // Dark Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            // Centered Title
            Center(
              child: Text(
                'Custom View',
                style: AppTheme.luxuryTheme.textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIntroSection extends StatelessWidget {
  const CustomIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Text(
            'Every home has its own story and so do the people who live in it',
            textAlign: TextAlign.center,
            style: AppTheme.luxuryTheme.textTheme.displayLarge?.copyWith(
              fontSize: 24,
              height: 1.4,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: SizedBox(
              width: 60,
              child: GoldDivider(),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'At M4, we believe your space should reflect you, not a template. That’s why we proudly introduce a first of its kind offering in the segment — complete home customization, designed around your preferences and lifestyle.\n\nFrom door laminates, flooring tiles, kitchen platforms, sanitary ware, and CP fittings to door locks and wall colors, every element can be tailored to your taste.\n\nAnd all of it included in the flat price itself.\n\nIt’s more than just a home; it’s a space crafted thoughtfully — with your choices, your comfort, and your individuality at its heart.\n\nBecause at M4, we don’t just build homes — we build your kind of home.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.softGrey,
              fontSize: 14,
              height: 1.8,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGridSection extends StatelessWidget {
  final List<CustomizationCategory> categories;

  const CustomGridSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCardWidget(category: categories[index]);
        },
      ),
    );
  }
}

class CustomCardWidget extends StatefulWidget {
  final CustomizationCategory category;

  const CustomCardWidget({super.key, required this.category});

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      onTap: () {
        context.push('/custom-view/detail', extra: widget.category);
      },
      child: AnimatedScale(
        scale: _isHovered ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: AppTheme.skeuomorphicDecoration(radius: 22),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.network(
                    widget.category.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                // Bottom Gradient Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.9),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                ),
                // Title at Bottom
                Positioned(
                  bottom: 16,
                  left: 12,
                  right: 12,
                  child: Text(
                    widget.category.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Subtle Gold Border Glow (managed by AppTheme.skeuomorphicDecoration)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';

class M4FamilyHeroSection extends StatelessWidget {
  const M4FamilyHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Lifestyle Image
        Container(
          height: 250,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: AppTheme.skeuomorphicDecoration(radius: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?q=80&w=1469&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class M4FamilyLogoSection extends StatelessWidget {
  const M4FamilyLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          // Logo Centerpiece
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryGold.withValues(alpha: 0.15),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'M4',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                  Text(
                    'GROUP',
                    style: GoogleFonts.poppins(
                      color: AppTheme.primaryGold,
                      fontSize: 10,
                      letterSpacing: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Family',
            style: GoogleFonts.clickerScript(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Living the ',
                style: GoogleFonts.poppins(
                  color: AppTheme.softGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'M4',
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' Life',
                style: GoogleFonts.poppins(
                  color: AppTheme.softGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
            child: SizedBox(
              width: 80,
              child: GoldDivider(),
            ),
          ),
        ],
      ),
    );
  }
}

class LifestyleGridSection extends StatelessWidget {
  const LifestyleGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=1470&auto=format&fit=crop', // Dining
      'https://images.unsplash.com/photo-1527529482837-4698179dc6ce?q=80&w=1470&auto=format&fit=crop', // Party
      'https://images.unsplash.com/photo-1484820540004-14229fe36ca4?q=80&w=1374&auto=format&fit=crop', // Kids
      'https://images.unsplash.com/photo-1523301343968-6a6ebf63c672?q=80&w=1469&auto=format&fit=crop', // Lifestyle
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return LifestyleImageCard(imageUrl: images[index]);
      },
    );
  }
}

class LifestyleImageCard extends StatefulWidget {
  final String imageUrl;

  const LifestyleImageCard({super.key, required this.imageUrl});

  @override
  State<LifestyleImageCard> createState() => _LifestyleImageCardState();
}

class _LifestyleImageCardState extends State<LifestyleImageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      onTap: () {
        // Fullscreen preview logic could go here
      },
      child: AnimatedScale(
        scale: _isHovered ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: AppTheme.skeuomorphicDecoration(radius: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

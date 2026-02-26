import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/project_model.dart';
import '../../../../widgets/luxury_widgets.dart';

/// A reusable luxury card with skeuomorphic depth and shadows.
class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: AppTheme.skeuomorphicDecoration(radius: radius),
      child: child,
    );
  }
}

/// Parallax Hero Section with Title and Status.
class ProjectHeroSection extends StatelessWidget {
  final ProjectModel project;
  final double scrollOffset;

  const ProjectHeroSection({
    super.key,
    required this.project,
    required this.scrollOffset,
  });

  @override
  Widget build(BuildContext context) {
    double parallaxOffset = scrollOffset * 0.5;

    return Stack(
      children: [
        // Parallax Image
        Transform.translate(
          offset: Offset(0, parallaxOffset),
          child: Hero(
            tag: 'project_image_${project.id}',
            child: Image.network(
              project.image,
              height: 450,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark Gradient Overlay
        Container(
          height: 450,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.8),
                AppTheme.luxuryBlack,
              ],
              stops: const [0.5, 0.85, 1.0],
            ),
          ),
        ),
        // Title and Info
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: project.status.toLowerCase() == 'completed'
                        ? Colors.green.withValues(alpha: 0.2)
                        : AppTheme.primaryGold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: project.status.toLowerCase() == 'completed'
                          ? Colors.greenAccent
                          : AppTheme.primaryGold,
                    ),
                  ),
                  child: Text(
                    project.status.toUpperCase(),
                    style: TextStyle(
                      color: project.status.toLowerCase() == 'completed'
                          ? Colors.greenAccent
                          : AppTheme.primaryGold,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project.name.toUpperCase(),
                  style: AppTheme.luxuryTheme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded,
                        color: AppTheme.primaryGold, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      project.location,
                      style: const TextStyle(
                          color: AppTheme.softGrey, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Overview Section with description.
class OverviewSection extends StatelessWidget {
  final String description;

  const OverviewSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldSectionTitle(title: 'Overview'),
        const SizedBox(height: 15),
        PremiumCard(
          child: Text(
            description,
            style: const TextStyle(
              color: AppTheme.softGrey,
              height: 1.8,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

/// Highlight Grid Section (2 columns).
class HighlightGridSection extends StatelessWidget {
  final List<HighlightModel> highlights;

  const HighlightGridSection({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldSectionTitle(title: 'Key Highlights'),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: highlights.length,
          itemBuilder: (context, index) {
            final highlight = highlights[index];
            return PremiumCard(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              radius: 15,
              child: Row(
                children: [
                  Icon(_getIconData(highlight.icon),
                      color: AppTheme.primaryGold, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      highlight.label,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'apartment':
        return Icons.apartment_rounded;
      case 'security':
        return Icons.security_rounded;
      case 'park':
        return Icons.park_rounded;
      case 'location_on':
        return Icons.location_on_rounded;
      case 'pool':
        return Icons.pool_rounded;
      case 'mountain':
        return Icons.landscape_rounded;
      case 'fence':
        return Icons.fence_rounded;
      case 'chair':
        return Icons.chair_rounded;
      default:
        return Icons.star_rounded;
    }
  }
}

/// Project Gallery Section.
class GallerySection extends StatelessWidget {
  final List<String> gallery;

  const GallerySection({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    if (gallery.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldSectionTitle(title: 'Project Gallery'),
        const SizedBox(height: 15),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gallery.length,
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: PremiumCard(
                  padding: EdgeInsets.zero,
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.network(
                        gallery[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppTheme.secondaryBlack,
                          child: const Icon(Icons.image_not_supported_outlined,
                              color: AppTheme.softGrey),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Map Section with placeholder.
class MapSection extends StatelessWidget {
  final LocationModel? location;

  const MapSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldSectionTitle(title: 'Location'),
        const SizedBox(height: 15),
        PremiumCard(
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // Placeholder for Map
                Container(
                  height: 200,
                  width: double.infinity,
                  color: AppTheme.secondaryBlack,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.map_outlined,
                          color: AppTheme.primaryGold.withValues(alpha: 0.3),
                          size: 100),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_rounded,
                              color: AppTheme.primaryGold, size: 40),
                          SizedBox(height: 8),
                          Text('MAP VIEW',
                              style: TextStyle(
                                  color: AppTheme.primaryGold,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        location?.address ?? 'Location coordinates pending',
                        style: const TextStyle(
                            color: AppTheme.softGrey, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      GoldButton(
                        label: 'View on Google Maps',
                        onPressed: () {},
                        icon: Icons.directions_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Inquiry Form Section.
class InquiryFormSection extends StatefulWidget {
  const InquiryFormSection({super.key});

  @override
  State<InquiryFormSection> createState() => _InquiryFormSectionState();
}

class _InquiryFormSectionState extends State<InquiryFormSection> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GoldSectionTitle(title: 'Connect With Us'),
        const SizedBox(height: 15),
        PremiumCard(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const LuxuryTextField(
                    hint: 'Full Name', icon: Icons.person_outline_rounded),
                const SizedBox(height: 15),
                const LuxuryTextField(
                    hint: 'Phone Number', icon: Icons.phone_outlined),
                const SizedBox(height: 15),
                const LuxuryTextField(
                    hint: 'Email Address', icon: Icons.email_outlined),
                const SizedBox(height: 15),
                const LuxuryTextField(
                    hint: 'Message', icon: Icons.message_outlined),
                const SizedBox(height: 25),
                GoldButton(
                  label: _isSubmitting ? 'Sending...' : 'Submit Inquiry',
                  onPressed: () async {
                    setState(() => _isSubmitting = true);
                    await Future.delayed(const Duration(seconds: 2));
                    if (!mounted) return;
                    setState(() => _isSubmitting = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Inquiry sent successfully!'),
                        backgroundColor: AppTheme.primaryGold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Helper for Gold Section Title.
class GoldSectionTitle extends StatelessWidget {
  final String title;

  const GoldSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 40,
          height: 2,
          decoration: const BoxDecoration(gradient: AppTheme.goldGradient),
        ),
      ],
    );
  }
}

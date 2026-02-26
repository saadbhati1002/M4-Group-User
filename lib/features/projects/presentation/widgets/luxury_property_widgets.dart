import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/property_detail_model.dart';

/// A thin gold gradient line for separators.
class GoldDivider extends StatelessWidget {
  const GoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppTheme.primaryGold,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

/// A short gold divider used under section titles.
class SectionGoldDivider extends StatelessWidget {
  const SectionGoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      decoration: const BoxDecoration(
        gradient: AppTheme.goldGradient,
      ),
    );
  }
}

/// Smoothly animates numbers from 0 to target.
class AnimatedCounterWidget extends StatefulWidget {
  final int end;
  final String label;
  final IconData? icon;

  const AnimatedCounterWidget({
    super.key,
    required this.end,
    required this.label,
    this.icon,
  });

  @override
  State<AnimatedCounterWidget> createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = IntTween(begin: 0, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, color: AppTheme.primaryGold, size: 28),
          const SizedBox(height: 8),
        ],
        Text(
          widget.label.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.softGrey,
            fontSize: 10,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text(
              _animation.value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}

/// 2-column grid of features with gold tick icons.
class FeatureGridWidget extends StatelessWidget {
  final List<FeatureModel> features;

  const FeatureGridWidget({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const Icon(Icons.check_circle_outline_rounded,
                color: AppTheme.primaryGold, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                features[index].label,
                style: const TextStyle(
                  color: AppTheme.softGrey,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Dark full-width section with animated stats.
class StatsCounterSection extends StatelessWidget {
  final List<StatModel> stats;

  const StatsCounterSection({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBlack,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppTheme.primaryGold.withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: stats.map((stat) {
          return AnimatedCounterWidget(
            end: stat.value,
            label: stat.label,
            icon: _getIconData(stat.icon),
          );
        }).toList(),
      ),
    );
  }

  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'apartment':
        return Icons.apartment_rounded;
      case 'layers':
        return Icons.layers_rounded;
      case 'star':
        return Icons.stars_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }
}

/// Top section with large image and vertical info stack.
class PropertyOverviewSection extends StatelessWidget {
  final PropertyDetailModel data;

  const PropertyOverviewSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              data.project.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'OVERVIEW',
            style: TextStyle(
              color: AppTheme.primaryGold,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.project.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data.tagline,
            style: const TextStyle(
              color: AppTheme.softGrey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.project.description,
            style: const TextStyle(
              color: AppTheme.softGrey,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          FeatureGridWidget(features: data.detailedFeatures),
        ],
      ),
    );
  }
}

/// 2-columns grid with hero animations.
class GalleryGridSection extends StatelessWidget {
  final List<GalleryModel> gallery;

  const GalleryGridSection({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            'M4 GROUP\'S',
            style: TextStyle(
              color: AppTheme.primaryGold,
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Ocean view in pictures',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemCount: gallery.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: AppTheme.skeuomorphicDecoration(radius: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    gallery[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Background image with blur overlay and tap icon.
class VirtualTourSection extends StatelessWidget {
  final VirtualTourModel data;

  const VirtualTourSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(data.tourUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage(data.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.3),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGold,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryGold.withValues(alpha: 0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.play_arrow_rounded,
                          color: Colors.black, size: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Image + text + YouTube button in a premium card.
class CustomFinishingSection extends StatelessWidget {
  final CustomFinishingModel data;

  const CustomFinishingSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: AppTheme.skeuomorphicDecoration(radius: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                data.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'M4 GROUP\'S',
              style: TextStyle(
                color: AppTheme.primaryGold,
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              data.description,
              style: const TextStyle(
                color: AppTheme.softGrey,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                final url = Uri.parse(data.youtubeUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              icon: const Icon(Icons.play_circle_fill_rounded, size: 18),
              label: const Text('View On Youtube'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: AppTheme.primaryGold,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: AppTheme.primaryGold, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Resident speak carousel with slider arrows.
class TestimonialCarouselSection extends StatefulWidget {
  final List<TestimonialModel> testimonials;

  const TestimonialCarouselSection({super.key, required this.testimonials});

  @override
  State<TestimonialCarouselSection> createState() =>
      _TestimonialCarouselSectionState();
}

class _TestimonialCarouselSectionState
    extends State<TestimonialCarouselSection> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TESTIMONIALS',
                style: TextStyle(
                  color: AppTheme.primaryGold,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Resident speak',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle_fill_rounded, size: 14),
                    label: const Text('View On Youtube',
                        style: TextStyle(fontSize: 10)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: AppTheme.primaryGold,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                            color: AppTheme.primaryGold, width: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        CarouselSlider(
          carouselController: _controller,
          items: widget.testimonials.map((testimonial) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.primaryGold, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(testimonial.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    testimonial.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      testimonial.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppTheme.softGrey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 350,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => _controller.previousPage(),
              icon: const Icon(Icons.arrow_back_rounded,
                  color: AppTheme.primaryGold),
            ),
            const SizedBox(width: 20),
            Row(
              children: List.generate(widget.testimonials.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppTheme.primaryGold
                        : AppTheme.softGrey.withValues(alpha: 0.3),
                  ),
                );
              }),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () => _controller.nextPage(),
              icon: const Icon(Icons.arrow_forward_rounded,
                  color: AppTheme.primaryGold),
            ),
          ],
        ),
      ],
    );
  }
}

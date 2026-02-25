import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ParallaxHeroSlider extends StatefulWidget {
  final List<String> images;
  const ParallaxHeroSlider({super.key, required this.images});

  @override
  State<ParallaxHeroSlider> createState() => _ParallaxHeroSliderState();
}

class _ParallaxHeroSliderState extends State<ParallaxHeroSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          options: CarouselOptions(
            height: 500,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Hero(
              tag: 'hero_image_$index',
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.images[index]),
                    fit: BoxFit.cover,
                    alignment: Alignment(0, (_currentIndex == index) ? 0 : 0.2),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentIndex == entry.key ? 25 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentIndex == entry.key
                      ? const Color(0xFFD4AF37)
                      : Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

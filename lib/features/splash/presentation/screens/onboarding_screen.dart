import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../widgets/luxury_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _data = [
    OnboardingData(
      title: 'Timeless\nElegance',
      subtitle: 'Experience real estate like never before with M4 Group.',
      image:
          'https://images.unsplash.com/photo-1600585154340-be6199f7c096?q=80&w=2070',
    ),
    OnboardingData(
      title: 'Premium\nDevelopments',
      subtitle: 'Award-winning architecture and construction quality.',
      image:
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=2071',
    ),
    OnboardingData(
      title: 'Global\nImpact',
      subtitle: 'Expanding our footprint across luxury lifestyle sectors.',
      image:
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=2070',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(_data[index].image, fit: BoxFit.cover),
                  Container(
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
                  Positioned(
                    bottom: 120,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _data[index].title.toUpperCase(),
                          style: AppTheme.luxuryTheme.textTheme.displayLarge
                              ?.copyWith(
                            color: AppTheme.white,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _data[index].subtitle,
                          style: const TextStyle(
                              color: AppTheme.softGrey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(_data.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _currentPage == index ? 30 : 10,
                      height: 5,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppTheme.primaryGold
                            : AppTheme.softGrey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
                GoldButton(
                  label: _currentPage == _data.length - 1 ? 'Start' : 'Next',
                  onPressed: () {
                    if (_currentPage < _data.length - 1) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else {
                      context.go(AppConstants.home);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final String image;
  OnboardingData(
      {required this.title, required this.subtitle, required this.image});
}

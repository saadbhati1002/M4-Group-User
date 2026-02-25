import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('INSIGHTS & NEWS')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: FadeInUp(
              delay: Duration(milliseconds: index * 100),
              child: LuxuryContainer(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22)),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1448630360428-65ff65dfcf3d?q=80&w=2073',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The Future of Luxury Living in Mumbai',
                            style: TextStyle(
                                color: AppTheme.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Explore how modern architecture is redefining the skyline and lifestyle of Indias luxury capital...',
                            style: TextStyle(
                                color: AppTheme.softGrey,
                                fontSize: 14,
                                height: 1.5),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('OCT 24, 2026',
                                  style: TextStyle(
                                      color: AppTheme.primaryGold,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                onPressed: () {},
                                child: const Text('READ ARTICLE',
                                    style: TextStyle(
                                        color: AppTheme.primaryGold,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/project_model.dart';
import '../../../../widgets/luxury_widgets.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectModel project;
  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: project.id,
                child: Image.network(project.image, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: LuxuryContainer(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  project.name.toUpperCase(),
                                  style: const TextStyle(
                                      color: AppTheme.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      letterSpacing: 1.5),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryGold,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  project.status,
                                  style: const TextStyle(
                                      color: AppTheme.luxuryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded,
                                  color: AppTheme.primaryGold, size: 16),
                              const SizedBox(width: 8),
                              Text(project.location,
                                  style: const TextStyle(
                                      color: AppTheme.softGrey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildSection('Overview', project.description),
                  const SizedBox(height: 30),
                  _buildAmenitiesGrid(project.amenities),
                  const SizedBox(height: 30),
                  LuxuryContainer(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text('RERA NUMBER',
                            style: TextStyle(
                                color: AppTheme.primaryGold,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        const SizedBox(height: 5),
                        Text(project.rera,
                            style: const TextStyle(
                                color: AppTheme.white,
                                fontSize: 16,
                                letterSpacing: 1.2)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GoldButton(
                    label: 'Book a Site Visit',
                    onPressed: () {},
                    icon: Icons.calendar_today_rounded,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return FadeInUp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle(title),
          const SizedBox(height: 15),
          LuxuryContainer(
            padding: const EdgeInsets.all(20),
            child: Text(
              content,
              style: const TextStyle(
                  color: AppTheme.softGrey, height: 1.6, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(String title) {
    return Row(
      children: [
        Container(
            width: 4,
            height: 18,
            decoration: const BoxDecoration(gradient: AppTheme.goldGradient)),
        const SizedBox(width: 10),
        Text(title.toUpperCase(),
            style: const TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2)),
      ],
    );
  }

  Widget _buildAmenitiesGrid(List<String> amenities) {
    return FadeInUp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle('Amenities'),
          const SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: amenities
                .map((a) => LuxuryContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      radius: 12,
                      child: Text(a,
                          style: const TextStyle(
                              color: AppTheme.softGrey, fontSize: 12)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

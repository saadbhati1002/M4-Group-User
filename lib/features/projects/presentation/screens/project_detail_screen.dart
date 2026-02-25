import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../data/models/project_model.dart';

class ProjectDetailScreen extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(project.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              background: Hero(
                tag: 'project-${project.id}',
                child: Image.network(
                  project.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.grey),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('LOCATION'),
                  const SizedBox(height: 5),
                  Text(project.location,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 20),
                  _buildSectionTitle('DESCRIPTION'),
                  const SizedBox(height: 10),
                  Text(project.description,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 25),
                  _buildSectionTitle('AMENITIES'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: project.amenities
                        .map((a) => _buildAmenityChip(a))
                        .toList(),
                  ),
                  const SizedBox(height: 25),
                  _buildSectionTitle('RERA NUMBER'),
                  const SizedBox(height: 5),
                  Text(project.rera,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryGold,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('ENQUIRE NOW',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: AppTheme.primaryGold,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
    );
  }

  Widget _buildAmenityChip(String label) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      borderRadius: 10,
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}

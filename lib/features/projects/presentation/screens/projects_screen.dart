import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('PROJECT PORTFOLIO')),
      body: projectsAsync.when(
        data: (projects) => GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return FadeInUp(
              delay: Duration(milliseconds: index * 50),
              child: LuxuryContainer(
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () =>
                      context.push(AppConstants.projectDetail, extra: project),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22)),
                          child: Hero(
                            tag: project.id,
                            child: Image.network(project.image,
                                fit: BoxFit.cover, width: double.infinity),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: AppTheme.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              project.location,
                              style: const TextStyle(
                                  color: AppTheme.softGrey, fontSize: 11),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    AppTheme.primaryGold.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppTheme.primaryGold
                                        .withValues(alpha: 0.3)),
                              ),
                              child: Text(
                                project.status.toUpperCase(),
                                style: const TextStyle(
                                    color: AppTheme.primaryGold,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold),
                              ),
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
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppTheme.primaryGold)),
        error: (e, r) => const Center(child: Text('Error loading projects')),
      ),
    );
  }
}

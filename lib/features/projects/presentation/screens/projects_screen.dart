import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/project_filter.dart';
import '../../../../widgets/luxury_drawer.dart';
import '../widgets/project_grid_widget.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  final ProjectFilter filter;

  const ProjectsScreen({
    super.key,
    this.filter = ProjectFilter.all,
  });

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
    // Update the filter provider when the screen is initialized or updated via router
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(projectFilterProvider.notifier).state = widget.filter;
    });
  }

  @override
  void didUpdateWidget(covariant ProjectsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filter != widget.filter) {
      ref.read(projectFilterProvider.notifier).state = widget.filter;
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectsProvider);
    final activeFilter = ref.watch(projectFilterProvider);

    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      drawer: const LuxuryDrawer(),
      appBar: AppBar(
        title: Text(
          activeFilter.displayName.toUpperCase(),
          style: const TextStyle(letterSpacing: 2, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Filter Header / Tabs Section
          _buildFilterHeader(activeFilter),

          Expanded(
            child: projectsAsync.when(
              data: (projects) {
                if (projects.isEmpty) {
                  return Center(
                    child: FadeIn(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded,
                              color: AppTheme.softGrey.withValues(alpha: 0.5),
                              size: 60),
                          const SizedBox(height: 16),
                          const Text(
                            'No projects found in this category',
                            style: TextStyle(color: AppTheme.softGrey),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ProjectGridWidget(
                  projects: projects,
                  onProjectTap: (project) {
                    context.push(AppConstants.projectDetail, extra: project);
                  },
                );
              },
              loading: () => const Center(
                  child:
                      CircularProgressIndicator(color: AppTheme.primaryGold)),
              error: (e, r) => const Center(
                  child: Text('Error loading projects',
                      style: TextStyle(color: Colors.redAccent))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterHeader(ProjectFilter activeFilter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(
            duration: const Duration(milliseconds: 500),
            child: Text(
              activeFilter.displayName,
              style: AppTheme.luxuryTheme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.primaryGold,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInLeft(
            duration: const Duration(milliseconds: 600),
            child: Container(
              width: 40,
              height: 3,
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

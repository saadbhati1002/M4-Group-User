import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../data/models/project_model.dart';
import 'project_card_widget.dart';

class ProjectGridWidget extends StatelessWidget {
  final List<ProjectModel> projects;
  final Function(ProjectModel) onProjectTap;

  const ProjectGridWidget({
    super.key,
    required this.projects,
    required this.onProjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return FadeInUp(
          duration: const Duration(milliseconds: 500),
          delay: Duration(milliseconds: 100 * index),
          child: ProjectCardWidget(
            project: project,
            onTap: () => onProjectTap(project),
          ),
        );
      },
      // Physics for smooth scrolling
      physics: const BouncingScrollPhysics(),
    );
  }
}

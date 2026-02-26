import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/project_model.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(widget.project.status);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: AppTheme.skeuomorphicDecoration(
            radius: 20,
            isPressed: _isPressed,
          ).copyWith(
            border: Border.all(
              color: AppTheme.primaryGold.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Image with Hero
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'project_image_${widget.project.id}',
                        child: Image.network(
                          widget.project.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: AppTheme.secondaryBlack,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryGold,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Status Badge
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: statusColor, width: 1),
                          ),
                          child: Text(
                            widget.project.status.toUpperCase(),
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Project Details
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.project.name,
                          style: const TextStyle(
                            color: AppTheme.primaryGold,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                color: AppTheme.softGrey, size: 12),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.project.location,
                                style: const TextStyle(
                                  color: AppTheme.softGrey,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return AppTheme.primaryGold;
      case 'completed':
        return Colors.greenAccent;
      case 'upcoming':
        return Colors.white70;
      default:
        return AppTheme.primaryGold;
    }
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/constants/app_constants.dart';
import '../models/project_model.dart';
import '../models/project_filter.dart';
import '../../core/services/cache_service.dart';

class ProjectRepository {
  static const String _projectsCacheKey = 'projects_cache';

  Future<List<ProjectModel>> getProjectsFiltered(ProjectFilter filter) async {
    // 1. Fetch all projects (from cache or bundle)
    List<ProjectModel> allProjects = await _getAllProjects();

    // 2. Filter based on logic
    if (filter == ProjectFilter.all) {
      return allProjects;
    }

    final filterString = filter.slug.toLowerCase();
    return allProjects
        .where((p) => p.status.toLowerCase() == filterString)
        .toList();
  }

  Future<List<ProjectModel>> _getAllProjects() async {
    // Try fetching from Cache first
    final cached = CacheService.getData(_projectsCacheKey);
    if (cached != null) {
      return (cached as List)
          .map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    // Fetch from Local JSON
    try {
      final String response =
          await rootBundle.loadString(AppConstants.dummyDataPath);
      final data = json.decode(response);
      final projects = (data['projects'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList();

      // Update Cache
      await CacheService.cacheData(
          _projectsCacheKey, projects.map((e) => e.toJson()).toList());

      return projects;
    } catch (e) {
      return [];
    }
  }
}

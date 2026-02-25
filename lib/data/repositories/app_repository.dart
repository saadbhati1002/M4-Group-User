import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/constants/app_constants.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../../core/services/cache_service.dart';

class AppRepository {
  static const String _projectsCacheKey = 'projects_cache';
  static const String _servicesCacheKey = 'services_cache';

  Future<List<ProjectModel>> getProjects() async {
    // 1. Try fetching from Cache first (Offline support)
    final cached = CacheService.getData(_projectsCacheKey);
    if (cached != null) {
      return (cached as List)
          .map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    // 2. Fetch from Local JSON (Simulating CMS API)
    try {
      final String response =
          await rootBundle.loadString(AppConstants.dummyDataPath);
      final data = json.decode(response);
      final projects = (data['projects'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList();

      // 3. Update Cache
      await CacheService.cacheData(
          _projectsCacheKey, projects.map((e) => e.toJson()).toList());

      return projects;
    } catch (e) {
      return [];
    }
  }

  Future<List<ServiceModel>> getServices() async {
    final cached = CacheService.getData(_servicesCacheKey);
    if (cached != null) {
      return (cached as List)
          .map((e) => ServiceModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    try {
      final String response =
          await rootBundle.loadString(AppConstants.dummyDataPath);
      final data = json.decode(response);
      final services = (data['services'] as List)
          .map((e) => ServiceModel.fromJson(e))
          .toList();

      await CacheService.cacheData(
          _servicesCacheKey, services.map((e) => e.toJson()).toList());

      return services;
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>> getHomePageData() async {
    try {
      final String response =
          await rootBundle.loadString(AppConstants.homepageDataPath);
      return json.decode(response);
    } catch (e) {
      return {};
    }
  }
}

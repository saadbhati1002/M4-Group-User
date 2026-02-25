import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../../../core/constants/app_constants.dart';

class AppRepository {
  Future<Map<String, dynamic>> _loadData() async {
    final String response =
        await rootBundle.loadString(AppConstants.dummyDataPath);
    return json.decode(response);
  }

  Future<List<ProjectModel>> getProjects() async {
    final data = await _loadData();
    return (data['projects'] as List)
        .map((e) => ProjectModel.fromJson(e))
        .toList();
  }

  Future<List<ServiceModel>> getServices() async {
    final data = await _loadData();
    return (data['services'] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }
}

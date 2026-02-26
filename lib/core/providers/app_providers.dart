import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/app_repository.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/models/project_model.dart';
import '../../data/models/service_model.dart';
import '../../data/models/project_filter.dart';

final appRepositoryProvider = Provider((ref) => AppRepository());
final projectRepositoryProvider = Provider((ref) => ProjectRepository());

final projectFilterProvider =
    StateProvider<ProjectFilter>((ref) => ProjectFilter.all);

final projectsProvider = FutureProvider<List<ProjectModel>>((ref) async {
  final repository = ref.watch(projectRepositoryProvider);
  final filter = ref.watch(projectFilterProvider);
  return repository.getProjectsFiltered(filter);
});

final servicesProvider = FutureProvider<List<ServiceModel>>((ref) async {
  final repository = ref.watch(appRepositoryProvider);
  return repository.getServices();
});

final homeDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.watch(appRepositoryProvider);
  return repository.getHomePageData();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/app_repository.dart';
import '../../data/models/project_model.dart';
import '../../data/models/service_model.dart';

final appRepositoryProvider = Provider((ref) => AppRepository());

final projectsProvider = FutureProvider<List<ProjectModel>>((ref) async {
  final repository = ref.watch(appRepositoryProvider);
  return repository.getProjects();
});

final servicesProvider = FutureProvider<List<ServiceModel>>((ref) async {
  final repository = ref.watch(appRepositoryProvider);
  return repository.getServices();
});

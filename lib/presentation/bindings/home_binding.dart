import 'package:get/get.dart';
import 'package:m4_user/core/services/api_service.dart';
import 'package:m4_user/data/repositories_impl/home_repository_impl.dart';
import 'package:m4_user/domain/repositories/home_repository.dart';
import 'package:m4_user/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(Get.find<ApiService>()));
    Get.lazyPut(() => HomeController(Get.find<HomeRepository>()));
  }
}

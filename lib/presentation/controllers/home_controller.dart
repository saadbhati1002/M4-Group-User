import 'package:get/get.dart';
import 'package:m4_user/data/models/banner_model.dart';
import 'package:m4_user/data/models/faq_model.dart';
import 'package:m4_user/data/models/package_model.dart';
import 'package:m4_user/domain/repositories/home_repository.dart';
import 'package:m4_user/core/services/logger_service.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  final banners = <BannerModel>[].obs;
  final popularPackages = <PackageModel>[].obs;
  final faqs = <FaqModel>[].obs;

  final isLoading = false.obs;
  final error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    isLoading.value = true;
    error.value = '';
    try {
      final bannerRes = await _homeRepository.getBanners();
      if (bannerRes.success) {
        banners.assignAll(bannerRes.data ?? []);
      }

      final packageRes = await _homeRepository.getPopularPackages();
      if (packageRes.success) {
        popularPackages.assignAll(packageRes.data ?? []);
      }

      final faqRes = await _homeRepository.getFaqs();
      if (faqRes.success) {
        faqs.assignAll(faqRes.data ?? []);
      }
    } catch (e) {
      AppLogger.error('Error fetching home data: $e');
      error.value = 'Failed to load data. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}

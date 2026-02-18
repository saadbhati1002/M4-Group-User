import 'package:m4_user/core/services/api_service.dart';
import 'package:m4_user/data/models/api_response_model.dart';
import 'package:m4_user/data/models/banner_model.dart';
import 'package:m4_user/data/models/faq_model.dart';
import 'package:m4_user/data/models/package_model.dart';
import 'package:m4_user/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<ApiResponseModel<List<BannerModel>>> getBanners() async {
    final response = await _apiService.get('/banners');
    return ApiResponseModel<List<BannerModel>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => (json as List).map((e) => BannerModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<ApiResponseModel<List<PackageModel>>> getPopularPackages() async {
    final response =
        await _apiService.get('/packages', queryParameters: {'per_page': 4});
    return ApiResponseModel<List<PackageModel>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => (json as List).map((e) => PackageModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<ApiResponseModel<List<FaqModel>>> getFaqs() async {
    final response = await _apiService.get('/faqs');
    return ApiResponseModel<List<FaqModel>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => (json as List).map((e) => FaqModel.fromJson(e)).toList(),
    );
  }
}

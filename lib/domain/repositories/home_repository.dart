import 'package:m4_user/data/models/banner_model.dart';
import 'package:m4_user/data/models/package_model.dart';
import 'package:m4_user/data/models/faq_model.dart';
import 'package:m4_user/data/models/api_response_model.dart';

abstract class HomeRepository {
  Future<ApiResponseModel<List<BannerModel>>> getBanners();
  Future<ApiResponseModel<List<PackageModel>>> getPopularPackages();
  Future<ApiResponseModel<List<FaqModel>>> getFaqs();
}

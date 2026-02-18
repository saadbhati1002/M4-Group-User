import 'package:m4_user/data/models/base_model.dart';

class BannerModel extends BaseModel {
  final int id;
  final String name;
  final String image;
  final int isActive;
  final int? packageId;
  final int? countryId;
  final int? regionId;
  final String bannerFrom;
  final String bannerTo;

  BannerModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
    this.packageId,
    this.countryId,
    this.regionId,
    required this.bannerFrom,
    required this.bannerTo,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      isActive: json['is_active'] ?? 0,
      packageId: json['package_id'],
      countryId: json['country_id'],
      regionId: json['region_id'],
      bannerFrom: json['banner_from'] ?? '',
      bannerTo: json['banner_to'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'is_active': isActive,
      'package_id': packageId,
      'country_id': countryId,
      'region_id': regionId,
      'banner_from': bannerFrom,
      'banner_to': bannerTo,
    };
  }
}

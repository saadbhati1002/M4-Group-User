import 'package:m4_user/data/models/base_model.dart';

class CountryModel extends BaseModel {
  final int id;
  final String name;
  final String slug;
  final String countryCode;
  final String image;
  final bool isActive;

  CountryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.countryCode,
    required this.image,
    required this.isActive,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      countryCode: json['country_code'] ?? '',
      image: json['image'] ?? '',
      isActive: json['is_active'] == true || json['is_active'] == 1,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'country_code': countryCode,
      'image': image,
      'is_active': isActive,
    };
  }
}

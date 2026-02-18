import 'package:m4_user/data/models/base_model.dart';
import 'package:m4_user/data/models/country_model.dart';

class PackageModel extends BaseModel {
  final int id;
  final String name;
  final String type;
  final int day;
  final bool isUnlimited;
  final String? shortInfo;
  final String data;
  final double netPrice;
  final CountryModel? country;
  final String? region;
  final String? sms;
  final String? mins;
  final bool isActive;
  final bool isPopular;

  PackageModel({
    required this.id,
    required this.name,
    required this.type,
    required this.day,
    required this.isUnlimited,
    this.shortInfo,
    required this.data,
    required this.netPrice,
    this.country,
    this.region,
    this.sms,
    this.mins,
    required this.isActive,
    required this.isPopular,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      day: json['day'] ?? 0,
      isUnlimited: json['is_unlimited'] == true || json['is_unlimited'] == 1,
      shortInfo: json['short_info'],
      data: json['data'] ?? '',
      netPrice: (json['net_price'] ?? 0).toDouble(),
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      region: json['region'],
      sms: json['sms'],
      mins: json['mins'],
      isActive: json['is_active'] == true || json['is_active'] == 1,
      isPopular: json['is_popular'] == true || json['is_popular'] == 1,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'day': day,
      'is_unlimited': isUnlimited,
      'short_info': shortInfo,
      'data': data,
      'net_price': netPrice,
      'country': country?.toJson(),
      'region': region,
      'sms': sms,
      'mins': mins,
      'is_active': isActive,
      'is_popular': isPopular,
    };
  }
}

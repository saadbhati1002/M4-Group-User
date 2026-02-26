class ProjectModel {
  final String id;
  final String name;
  final String location;
  final String status;
  final String description;
  final String image;
  final List<String> amenities;
  final String rera;
  final List<HighlightModel> highlights;
  final List<String> gallery;
  final LocationModel? locationData;

  ProjectModel({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
    required this.description,
    required this.image,
    required this.amenities,
    required this.rera,
    this.highlights = const [],
    this.gallery = const [],
    this.locationData,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
      description: json['description'],
      image: json['image'],
      amenities: List<String>.from(json['amenities'] ?? []),
      rera: json['rera'] ?? '',
      highlights: (json['highlights'] as List?)
              ?.map((e) => HighlightModel.fromJson(e))
              .toList() ??
          [],
      gallery: List<String>.from(json['gallery'] ?? []),
      locationData: json['location_data'] != null
          ? LocationModel.fromJson(json['location_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'status': status,
      'description': description,
      'image': image,
      'amenities': amenities,
      'rera': rera,
      'highlights': highlights.map((e) => e.toJson()).toList(),
      'gallery': gallery,
      'location_data': locationData?.toJson(),
    };
  }
}

class HighlightModel {
  final String icon;
  final String label;

  HighlightModel({required this.icon, required this.label});

  factory HighlightModel.fromJson(Map<String, dynamic> json) {
    return HighlightModel(
      icon: json['icon'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {'icon': icon, 'label': label};
}

class LocationModel {
  final double lat;
  final double lng;
  final String address;

  LocationModel({required this.lat, required this.lng, required this.address});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng, 'address': address};
}

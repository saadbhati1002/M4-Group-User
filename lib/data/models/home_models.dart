class HomeBannerModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String ctaText;

  HomeBannerModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.ctaText,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
      ctaText: json['ctaText'],
    );
  }
}

class BusinessModel {
  final String title;
  final String description;
  final String icon; // Icon name as string

  BusinessModel({
    required this.title,
    required this.description,
    required this.icon,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class ProjectPreviewModel {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final String status;

  ProjectPreviewModel({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.status,
  });

  factory ProjectPreviewModel.fromJson(Map<String, dynamic> json) {
    return ProjectPreviewModel(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      status: json['status'],
    );
  }
}

class BlogPreviewModel {
  final String title;
  final String excerpt;
  final String imageUrl;
  final String date;

  BlogPreviewModel({
    required this.title,
    required this.excerpt,
    required this.imageUrl,
    required this.date,
  });

  factory BlogPreviewModel.fromJson(Map<String, dynamic> json) {
    return BlogPreviewModel(
      title: json['title'],
      excerpt: json['excerpt'],
      imageUrl: json['imageUrl'],
      date: json['date'],
    );
  }
}

class SectionModel {
  final String title;
  final String subtitle;
  final String
      type; // hero, about, business, projects, vision, mission, blog, cta
  final dynamic data;

  SectionModel({
    required this.title,
    required this.subtitle,
    required this.type,
    this.data,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      type: json['type'],
      data: json['data'],
    );
  }
}

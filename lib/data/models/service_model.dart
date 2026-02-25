class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String icon;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

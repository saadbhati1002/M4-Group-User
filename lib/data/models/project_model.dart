class ProjectModel {
  final String id;
  final String name;
  final String location;
  final String status;
  final String description;
  final String image;
  final List<String> amenities;
  final String rera;

  ProjectModel({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
    required this.description,
    required this.image,
    required this.amenities,
    required this.rera,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
      description: json['description'],
      image: json['image'],
      amenities: List<String>.from(json['amenities']),
      rera: json['rera'],
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
    };
  }
}

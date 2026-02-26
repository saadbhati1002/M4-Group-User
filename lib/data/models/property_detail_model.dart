import 'project_model.dart';

class FeatureModel {
  final String label;
  final String? icon;

  FeatureModel({required this.label, this.icon});

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      label: json['label'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'icon': icon,
      };
}

class StatModel {
  final int value;
  final String label;
  final String? icon;

  StatModel({required this.value, required this.label, this.icon});

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      value: json['value'],
      label: json['label'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'label': label,
        'icon': icon,
      };
}

class GalleryModel {
  final String imageUrl;
  final String title;

  GalleryModel({required this.imageUrl, required this.title});

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      imageUrl: json['imageUrl'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'title': title,
      };
}

class TestimonialModel {
  final String name;
  final String image;
  final String text;

  TestimonialModel({
    required this.name,
    required this.image,
    required this.text,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      name: json['name'],
      image: json['image'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'text': text,
      };
}

class VirtualTourModel {
  final String backgroundImage;
  final String tourUrl;
  final String title;

  VirtualTourModel({
    required this.backgroundImage,
    required this.tourUrl,
    required this.title,
  });

  factory VirtualTourModel.fromJson(Map<String, dynamic> json) {
    return VirtualTourModel(
      backgroundImage: json['backgroundImage'],
      tourUrl: json['tourUrl'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'backgroundImage': backgroundImage,
        'tourUrl': tourUrl,
        'title': title,
      };
}

class CustomFinishingModel {
  final String imageUrl;
  final String title;
  final String description;
  final String youtubeUrl;

  CustomFinishingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.youtubeUrl,
  });

  factory CustomFinishingModel.fromJson(Map<String, dynamic> json) {
    return CustomFinishingModel(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      youtubeUrl: json['youtubeUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'title': title,
        'description': description,
        'youtubeUrl': youtubeUrl,
      };
}

class PropertyDetailModel {
  final ProjectModel project;
  final String tagline;
  final List<FeatureModel> detailedFeatures;
  final List<StatModel> stats;
  final List<GalleryModel> detailedGallery;
  final VirtualTourModel virtualTour;
  final CustomFinishingModel customFinishing;
  final List<TestimonialModel> testimonials;

  PropertyDetailModel({
    required this.project,
    required this.tagline,
    required this.detailedFeatures,
    required this.stats,
    required this.detailedGallery,
    required this.virtualTour,
    required this.customFinishing,
    required this.testimonials,
  });

  factory PropertyDetailModel.mock() {
    return PropertyDetailModel(
      project: ProjectModel(
        id: 'ocean_view_1',
        name: 'Ocean View',
        location: 'Mazagon, Mumbai',
        status: 'Ongoing',
        description:
            '21 floors high in the heart of Mazagon, M4 Ocean View offers a front-row seat to the Arabian Sea. This seafront address brings together panoramic vistas, contemporary architecture, and a lifestyle defined by luxury. Thoughtfully designed residences are complemented by a curated selection of premium amenities.',
        image:
            'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?q=80&w=1000&auto=format&fit=crop',
        amenities: ['Sky Lounge', 'Fitness Centre', 'Rooftop Swimming Pool'],
        rera: 'P51900012345',
        highlights: [
          HighlightModel(icon: 'apartment', label: '21 residential floors'),
          HighlightModel(icon: 'pool', label: 'Rooftop Swimming Pool'),
        ],
        gallery: [
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1000&auto=format&fit=crop',
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=1000&auto=format&fit=crop',
        ],
        locationData: LocationModel(
            lat: 18.9633,
            lng: 72.8436,
            address: 'Mazagon, Mumbai, Maharashtra'),
      ),
      tagline: 'A Life Above And Beyond',
      detailedFeatures: [
        FeatureModel(label: '21 residential floors'),
        FeatureModel(label: '1,2,3 BHK apartments'),
        FeatureModel(label: 'Expansive sea views from upper floors'),
        FeatureModel(label: 'Grand, Double-Height Entrance Lobby'),
        FeatureModel(label: 'High Speed Lifts'),
        FeatureModel(label: 'Rooftop Swimming Pool'),
        FeatureModel(label: 'Sky Lounge'),
        FeatureModel(label: 'Fitness Centre'),
        FeatureModel(label: '24x7 Gated Security'),
        FeatureModel(label: 'Smart Homes'),
      ],
      stats: [
        StatModel(value: 50, label: 'Apartments', icon: 'apartment'),
        StatModel(value: 21, label: 'Floors', icon: 'layers'),
        StatModel(value: 7, label: 'Luxury Amenities', icon: 'star'),
      ],
      detailedGallery: [
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1000&auto=format&fit=crop',
            title: 'Gym'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=1000&auto=format&fit=crop',
            title: 'Living Room'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1540518614846-7eded433c457?q=80&w=1000&auto=format&fit=crop',
            title: 'Lobby'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=1000&auto=format&fit=crop',
            title: 'Pool'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1505691938895-1758d7eaa511?q=80&w=1000&auto=format&fit=crop',
            title: 'Bedroom'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?q=80&w=1000&auto=format&fit=crop',
            title: 'Bathroom'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1448630360428-65456885c650?q=80&w=1000&auto=format&fit=crop',
            title: 'Elevator'),
        GalleryModel(
            imageUrl:
                'https://images.unsplash.com/photo-1541123437800-1bb1317badc2?q=80&w=1000&auto=format&fit=crop',
            title: 'Balcony'),
      ],
      virtualTour: VirtualTourModel(
        backgroundImage:
            'https://images.unsplash.com/photo-1558005530-d7c716212a2a?q=80&w=1000&auto=format&fit=crop',
        tourUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        title: 'M4 Group’s Step Inside Your Future Home',
      ),
      customFinishing: CustomFinishingModel(
        imageUrl:
            'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?q=80&w=1000&auto=format&fit=crop',
        title: 'Custom Finishing',
        description:
            'M4 Ocean View offered buyers the freedom to personalize their homes with a wide range of tiles, wall paints, and wooden finishes—creating spaces that reflect individual style and comfort.',
        youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
      testimonials: [
        TestimonialModel(
          name: 'Saaquib Sallim',
          image:
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1000&auto=format&fit=crop',
          text:
              'I and my family loved the process of selecting can deliver results.',
        ),
        TestimonialModel(
          name: 'John Doe',
          image:
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=1000&auto=format&fit=crop',
          text: 'Charmed by the location and the lifestyle that.',
        ),
      ],
    );
  }
}

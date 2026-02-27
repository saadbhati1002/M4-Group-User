class CustomizationCategory {
  final String id;
  final String title;
  final String imageUrl;
  final List<CustomizationItem>? items;

  CustomizationCategory({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.items,
  });

  static List<CustomizationCategory> get mockCategories => [
        CustomizationCategory(
          id: 'door_laminates',
          title: 'Door Laminates',
          imageUrl:
              'https://images.unsplash.com/photo-1513694014197-f8303f2956cf?q=80&w=1000&auto=format&fit=crop',
        ),
        CustomizationCategory(
          id: 'flooring_tiles',
          title: 'Flooring tiles',
          imageUrl:
              'https://images.unsplash.com/photo-1581092143343-2396e6255169?q=80&w=1000&auto=format&fit=crop',
        ),
        CustomizationCategory(
          id: 'kitchen_platforms',
          title: 'Kitchen platforms',
          imageUrl:
              'https://images.unsplash.com/photo-1556911223-e27021882721?q=80&w=1000&auto=format&fit=crop',
        ),
        CustomizationCategory(
          id: 'sanitary_fitting',
          title: 'Sanitary fitting',
          imageUrl:
              'https://images.unsplash.com/photo-1584622781564-1d987f7333c1?q=80&w=1000&auto=format&fit=crop',
        ),
        CustomizationCategory(
          id: 'door_locks',
          title: 'Door locks',
          imageUrl:
              'https://images.unsplash.com/photo-1549488344-cbb03a670355?q=80&w=1000&auto=format&fit=crop',
        ),
        CustomizationCategory(
          id: 'wall_colours',
          title: 'Wall Colours',
          imageUrl:
              'https://images.unsplash.com/photo-1560185127-6a4358641151?q=80&w=1000&auto=format&fit=crop',
        ),
      ];
}

class CustomizationItem {
  final String name;
  final String imageUrl;

  CustomizationItem({required this.name, required this.imageUrl});
}

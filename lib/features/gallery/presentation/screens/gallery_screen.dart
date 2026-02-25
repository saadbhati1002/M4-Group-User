import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<String> images = const [
    'https://images.unsplash.com/photo-1600585154340-be6199f7c096?q=80&w=2070',
    'https://images.unsplash.com/photo-1613490493576-7fde63acd811?q=80&w=2071',
    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=2070',
    'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069',
    'https://images.unsplash.com/photo-1541888946425-d81bb19480c5?q=80&w=2070',
    'https://images.unsplash.com/photo-1448630360428-65ff65dfcf3d?q=80&w=2073',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('VISUAL GALLERY')),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return FadeIn(
            delay: Duration(milliseconds: index * 50),
            child: LuxuryContainer(
              padding: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: InkWell(
                  onTap: () => _showImage(context, images[index]),
                  child: Image.network(images[index], fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImage(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: LuxuryContainer(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(url),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('CLOSE',
                      style: TextStyle(color: AppTheme.primaryGold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

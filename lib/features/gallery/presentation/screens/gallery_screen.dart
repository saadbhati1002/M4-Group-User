import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://m4group.in/images/gallery1.jpg',
      'https://m4group.in/images/gallery2.jpg',
      'https://m4group.in/images/gallery3.jpg',
      'https://m4group.in/images/gallery4.jpg',
      'https://m4group.in/images/gallery5.jpg',
      'https://m4group.in/images/gallery6.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GALLERY'),
        backgroundColor: AppTheme.charcoal,
        foregroundColor: AppTheme.primaryGold,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return FadeIn(
            delay: Duration(milliseconds: index * 50),
            child: GestureDetector(
              onTap: () => _showImageDialog(context, images[index]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.photo, color: Colors.grey),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class LuxuryPlaceholderScreen extends StatelessWidget {
  final String title;
  const LuxuryPlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: Text(title.toUpperCase())),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LuxuryContainer(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: Colors.amber, size: 50),
                const SizedBox(height: 20),
                Text(
                  '$title SECTION',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This premium section is being curated to meet the highest M4 Group standards.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

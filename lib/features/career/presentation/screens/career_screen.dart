import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/glass_card.dart';

class CareerScreen extends StatelessWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAREERS'),
        backgroundColor: AppTheme.charcoal,
        foregroundColor: AppTheme.primaryGold,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'WORK WITH US',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Join a legacy of excellence and innovation.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildJobCard('Project Manager', 'Grant Road, Mumbai', 'Full Time'),
            const SizedBox(height: 15),
            _buildJobCard('Civil Engineer', 'Lonavala Site', 'Full Time'),
            const SizedBox(height: 15),
            _buildJobCard('Sales Executive', 'Grant Road, Mumbai', 'Full Time'),
            const SizedBox(height: 40),
            GlassCard(
              child: Column(
                children: [
                  const Text('NOT FINDING A FIT?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Send your CV to careers@m4group.in',
                      style: TextStyle(color: AppTheme.primaryGold)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.charcoal,
                        foregroundColor: Colors.white),
                    child: const Text('UPLOAD RESUME'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(String title, String loc, String type) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$loc • $type'),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: AppTheme.primaryGold),
        onTap: () {},
      ),
    );
  }
}

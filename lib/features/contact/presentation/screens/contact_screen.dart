import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/glass_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  static const _officeLocation =
      LatLng(18.9616, 72.8228); // Placeholder for Grant Road, Mumbai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTACT US'),
        backgroundColor: AppTheme.charcoal,
        foregroundColor: AppTheme.primaryGold,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildMapSection(),
            const SizedBox(height: 30),
            _buildContactInfo(context),
            const SizedBox(height: 30),
            _buildActionButtons(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 250,
        color: Colors.grey[300],
        child: GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: _officeLocation, zoom: 15),
          markers: {
            const Marker(
                markerId: MarkerId('office'), position: _officeLocation),
          },
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return GlassCard(
      child: Column(
        children: [
          const Text(
            'GET IN TOUCH',
            style: TextStyle(
                color: AppTheme.primaryGold,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(Icons.location_on, 'Grant Road, Mumbai, Maharashtra'),
          const Divider(height: 30),
          _buildInfoRow(Icons.email, 'sales@m4group.in'),
          const Divider(height: 30),
          _buildInfoRow(Icons.phone, '+91 12345 67890'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryGold),
        const SizedBox(width: 15),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionBtn(
            'CALL NOW',
            Icons.phone,
            () => _launchUrl('tel:+911234567890'),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _buildActionBtn(
            'EMAIL US',
            Icons.email,
            () => _launchUrl('mailto:sales@m4group.in'),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBtn(String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.charcoal,
        foregroundColor: AppTheme.primaryGold,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('CONTACT CONCIERGE')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FadeInUp(
              child: const LuxuryContainer(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Icon(Icons.location_on_rounded,
                        color: AppTheme.primaryGold, size: 40),
                    SizedBox(height: 15),
                    Text(
                      'CORPORATE OFFICE',
                      style: TextStyle(
                          color: AppTheme.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'M4 Group, Nariman Point,\nMumbai, Maharashtra 400021',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppTheme.softGrey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: _buildContactBox(
                        Icons.call, 'CALL', '+91 22 1234 5678')),
                const SizedBox(width: 15),
                Expanded(
                    child: _buildContactBox(
                        Icons.email, 'EMAIL', 'info@m4group.in')),
              ],
            ),
            const SizedBox(height: 30),
            _buildInquirySection(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildContactBox(IconData icon, String label, String value) {
    return LuxuryContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryGold, size: 24),
          const SizedBox(height: 12),
          Text(label,
              style: const TextStyle(
                  color: AppTheme.primaryGold,
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(color: AppTheme.white, fontSize: 11),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildInquirySection(BuildContext context) {
    return FadeInUp(
      child: LuxuryContainer(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SEND AN INQUIRY',
              style: TextStyle(
                  color: AppTheme.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            const SizedBox(height: 20),
            const LuxuryTextField(
                hint: 'Full Name', icon: Icons.person_outline),
            const SizedBox(height: 15),
            const LuxuryTextField(
                hint: 'Email Address', icon: Icons.email_outlined),
            const SizedBox(height: 15),
            const LuxuryTextField(
                hint: 'Mobile Number', icon: Icons.phone_android_outlined),
            const SizedBox(height: 25),
            GoldButton(
              label: 'Submit Request',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

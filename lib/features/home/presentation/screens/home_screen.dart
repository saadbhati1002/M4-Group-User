import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/parallax_hero_slider.dart';
import '../../../../widgets/glass_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const ParallaxHeroSlider(
                  images: [
                    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=2070',
                    'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069',
                    'https://images.unsplash.com/photo-1541888946425-d81bb19480c5?q=80&w=2070',
                  ],
                ),
                const SizedBox(height: 30),
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: _buildAboutSection(context),
                ),
                const SizedBox(height: 40),
                _buildSectionHeader(context, 'BUSINESS HIGHLIGHTS'),
                FadeInLeft(
                  child: _buildHighlightsGrid(context),
                ),
                const SizedBox(height: 40),
                _buildSectionHeader(context, 'CURRENT VENTURES'),
                FadeInRight(
                  child: _buildVenturesList(context),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppConstants.contact),
        backgroundColor: AppTheme.primaryGold,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.support_agent),
        label: const Text('QUICK CONNECT'),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 80,
      backgroundColor: AppTheme.charcoal,
      title: FadeInRight(
        child: const Text(
          'M4 GROUP',
          style: TextStyle(
            color: AppTheme.primaryGold,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppTheme.primaryGold),
      actions: [
        IconButton(
          onPressed: () => context.push(AppConstants.contact),
          icon: const Icon(Icons.contact_support_outlined),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 25,
            decoration: BoxDecoration(
              color: AppTheme.primaryGold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GlassCard(
        child: Column(
          children: [
            const Text(
              'A LEGACY OF EXCELLENCE',
              style: TextStyle(
                color: AppTheme.primaryGold,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'M4 Group is a multifaceted corporate entity dedicated to luxury real estate, innovative construction, and premium lifestyle ventures.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => context.push(AppConstants.about),
              child: const Text('KNOW MORE',
                  style: TextStyle(color: AppTheme.primaryGold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsGrid(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildBusinessCard(context, 'Real Estate', Icons.home_work),
          _buildBusinessCard(context, 'Construction', Icons.build),
          _buildBusinessCard(context, 'Luxury Villas', Icons.pool),
        ],
      ),
    );
  }

  Widget _buildBusinessCard(BuildContext context, String title, IconData icon) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      child: GlassCard(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: AppTheme.primaryGold),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVenturesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildVentureItem(context, 'M4 Aura Heights', 'Grant Road, Mumbai'),
          const SizedBox(height: 15),
          _buildVentureItem(context, 'Eu4ria Villas', 'Lonavala'),
        ],
      ),
    );
  }

  Widget _buildVentureItem(BuildContext context, String title, String loc) {
    return GestureDetector(
      onTap: () => context.push(AppConstants.projects),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppTheme.charcoal,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: const BoxDecoration(
                color: AppTheme.darkGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.apartment,
                  color: AppTheme.primaryGold, size: 40),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      loc,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppTheme.primaryGold, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.charcoal,
      selectedItemColor: AppTheme.primaryGold,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
        if (index == 1) context.push(AppConstants.projects);
        if (index == 2) context.push(AppConstants.gallery);
        if (index == 3) context.push(AppConstants.contact);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Projects'),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_library), label: 'Gallery'),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_page), label: 'Contact'),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.charcoal,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apartment_rounded,
                    size: 50, color: AppTheme.primaryGold),
                SizedBox(height: 10),
                Text(
                  'M4 GROUP',
                  style: TextStyle(
                    color: AppTheme.primaryGold,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'Home', Icons.home, AppConstants.home),
          _buildDrawerItem(
              context, 'About Us', Icons.info_outline, AppConstants.about),
          _buildDrawerItem(context, 'Services', Icons.miscellaneous_services,
              AppConstants.services),
          _buildDrawerItem(
              context, 'Projects', Icons.apartment, AppConstants.projects),
          _buildDrawerItem(
              context, 'Gallery', Icons.photo_library, AppConstants.gallery),
          _buildDrawerItem(context, 'Blogs & News', Icons.article_outlined,
              AppConstants.blog),
          _buildDrawerItem(
              context, 'Careers', Icons.work_outline, AppConstants.career),
          _buildDrawerItem(context, 'Contact Us', Icons.contact_mail_outlined,
              AppConstants.contact),
          const Divider(color: Colors.white24),
          _buildDrawerItem(context, 'Inquiry Form', Icons.message_outlined,
              AppConstants.inquiry),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        context.push(route);
      },
    );
  }
}

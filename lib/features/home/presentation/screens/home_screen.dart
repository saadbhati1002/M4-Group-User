import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
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
                _buildHeroSlider(),
                _buildAboutSection(context),
                _buildBusinessSection(context),
                _buildVenturesSection(context),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
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

  Widget _buildHeroSlider() {
    final List<String> images = [
      'https://m4group.in/images/slider1.jpg',
      'https://m4group.in/images/slider2.jpg',
      'https://m4group.in/images/slider3.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: FadeInLeft(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CRAFTING TIMELESS\nRESIDENCES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => context.push(AppConstants.projects),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryGold,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('VIEW PROJECTS'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GlassCard(
        child: Column(
          children: [
            FadeInUp(
              child: const Text(
                'A LEGACY OF EXCELLENCE',
                style: TextStyle(
                  color: AppTheme.primaryGold,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
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

  Widget _buildBusinessSection(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'OUR BUSINESSES',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildBusinessCard(context, 'Real Estate', Icons.home_work),
              _buildBusinessCard(context, 'Construction', Icons.build),
              _buildBusinessCard(context, 'Luxury Villas', Icons.pool),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBusinessCard(BuildContext context, String title, IconData icon) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      child: GlassCard(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppTheme.primaryGold),
            const SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildVenturesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CURRENT VENTURES',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildVentureItem(context, 'M4 Aura Heights', 'Grant Road, Mumbai'),
          const SizedBox(height: 15),
          _buildVentureItem(context, 'Eu4ria Villas', 'Lonavala'),
        ],
      ),
    );
  }

  Widget _buildVentureItem(BuildContext context, String title, String loc) {
    return GestureDetector(
      onTap: () => context.push(AppConstants.projectDetail),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppTheme.charcoal,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: const Icon(Icons.image, color: Colors.white54),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    const SizedBox(height: 5),
                    Text(loc, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.chevron_right, color: AppTheme.primaryGold),
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
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apartment_rounded,
                    size: 60, color: AppTheme.primaryGold),
                SizedBox(height: 10),
                Text('M4 GROUP',
                    style: TextStyle(
                        color: AppTheme.primaryGold,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
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
          _buildDrawerItem(
              context, 'Inquiry Form', Icons.message_outlined, '/inquiry'),
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

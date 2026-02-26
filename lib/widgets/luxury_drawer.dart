import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_theme.dart';
import '../core/constants/app_constants.dart';
import 'luxury_widgets.dart';

class LuxuryDrawer extends StatefulWidget {
  const LuxuryDrawer({super.key});

  @override
  State<LuxuryDrawer> createState() => _LuxuryDrawerState();
}

class _LuxuryDrawerState extends State<LuxuryDrawer> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      backgroundColor: AppTheme.luxuryBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppTheme.primaryGold.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            const LuxuryDrawerHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.1],
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  children: [
                    _DrawerItem(
                      icon: Icons.home_rounded,
                      label: 'Home',
                      route: AppConstants.home,
                      currentRoute: currentRoute,
                    ),
                    _ExpandableDrawerItem(
                      icon: Icons.business_rounded,
                      label: 'Projects',
                      currentRoute: currentRoute,
                      children: [
                        _DrawerItem(
                          icon: Icons.list_alt_rounded,
                          label: 'All Projects',
                          route: '${AppConstants.projects}?filter=all',
                          currentRoute: currentRoute,
                          isSubItem: true,
                        ),
                        _DrawerItem(
                          icon: Icons.pending_actions_rounded,
                          label: 'Ongoing Projects',
                          route: '${AppConstants.projects}?filter=ongoing',
                          currentRoute: currentRoute,
                          isSubItem: true,
                        ),
                        _DrawerItem(
                          icon: Icons.task_alt_rounded,
                          label: 'Completed Projects',
                          route: '${AppConstants.projects}?filter=completed',
                          currentRoute: currentRoute,
                          isSubItem: true,
                        ),
                      ],
                    ),
                    _DrawerItem(
                      icon: Icons.view_quilt_rounded,
                      label: 'Custom View',
                      route: AppConstants.customView,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.groups_rounded,
                      label: 'M4 Family',
                      route: AppConstants.m4Family,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.storefront_rounded,
                      label: 'Our Business',
                      route: AppConstants.ourBusiness,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.lightbulb_outline_rounded,
                      label: 'Vision & Mission',
                      route: AppConstants.visionMission,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.info_outline_rounded,
                      label: 'About',
                      route: AppConstants.about,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.article_outlined,
                      label: 'Blogs',
                      route: AppConstants.blog,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.perm_media_outlined,
                      label: 'Media',
                      route: AppConstants.media,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.work_outline_rounded,
                      label: 'Career',
                      route: AppConstants.career,
                      currentRoute: currentRoute,
                    ),
                    _DrawerItem(
                      icon: Icons.contact_mail_outlined,
                      label: 'Contact',
                      route: AppConstants.contact,
                      currentRoute: currentRoute,
                    ),
                  ],
                ),
              ),
            ),
            // const _DrawerFooter(), - Removed as per requirements
          ],
        ),
      ),
    );
  }
}

class LuxuryDrawerHeader extends StatelessWidget {
  const LuxuryDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBlack,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: AppTheme.skeuomorphicDecoration(radius: 50),
            child: const Icon(Icons.apartment_rounded,
                color: AppTheme.primaryGold, size: 40),
          ),
          const SizedBox(height: 15),
          Text(
            'M4 GROUP',
            style: AppTheme.luxuryTheme.textTheme.titleLarge?.copyWith(
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 15),
          const GoldDivider(),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String currentRoute;
  final bool isSubItem;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
    this.isSubItem = false,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentRoute.startsWith(route.split('?').first) &&
        (route.contains('?')
            ? currentRoute.contains(route.split('?').last)
            : !currentRoute.contains('?'));

    return Padding(
      padding: EdgeInsets.only(left: isSubItem ? 30 : 15, right: 15, bottom: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: isSelected
            ? AppTheme.skeuomorphicDecoration(radius: 12, isPressed: true)
            : null,
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? AppTheme.primaryGold : AppTheme.softGrey,
            size: isSubItem ? 20 : 24,
          ),
          title: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.softGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: isSubItem ? 13 : 14,
            ),
          ),
          trailing: isSelected ? const GoldSelectionIndicator() : null,
          onTap: () {
            Navigator.pop(context);
            context.go(route);
          },
        ),
      ),
    );
  }
}

class _ExpandableDrawerItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<Widget> children;
  final String currentRoute;

  const _ExpandableDrawerItem({
    required this.icon,
    required this.label,
    required this.children,
    required this.currentRoute,
  });

  @override
  State<_ExpandableDrawerItem> createState() => _ExpandableDrawerItemState();
}

class _ExpandableDrawerItemState extends State<_ExpandableDrawerItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(widget.icon, color: AppTheme.softGrey),
            title: Text(
              widget.label,
              style: const TextStyle(color: AppTheme.softGrey, fontSize: 14),
            ),
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: AppTheme.primaryGold,
            ),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(children: widget.children),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

class GoldSelectionIndicator extends StatelessWidget {
  const GoldSelectionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 20,
      decoration: BoxDecoration(
        gradient: AppTheme.goldGradient,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGold.withValues(alpha: 0.5),
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}

// Footer and social icons removed as per requirements

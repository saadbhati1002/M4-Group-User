import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../widgets/luxury_widgets.dart';
import '../../../../widgets/luxury_drawer.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);

    return Scaffold(
      drawer: const LuxuryDrawer(),
      appBar: AppBar(title: const Text('EXPERT VERTICALS')),
      body: servicesAsync.when(
        data: (services) => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: FadeInUp(
                delay: Duration(milliseconds: index * 100),
                child: LuxuryContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: AppTheme.skeuomorphicDecoration(
                                radius: 12, isPressed: true),
                            child: Icon(_getIcon(service.icon),
                                color: AppTheme.primaryGold),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              service.title.toUpperCase(),
                              style: const TextStyle(
                                  color: AppTheme.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        service.description,
                        style: const TextStyle(
                            color: AppTheme.softGrey, height: 1.4),
                      ),
                      const SizedBox(height: 20),
                      const GoldDivider(),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text('EXPLORE CAPABILITIES',
                            style: TextStyle(
                                color: AppTheme.primaryGold, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppTheme.primaryGold)),
        error: (e, r) => Center(
            child: Text('Error loading services',
                style: TextStyle(color: AppTheme.white))),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'home_work':
        return Icons.home_work_rounded;
      case 'build':
        return Icons.build_rounded;
      case 'pool':
        return Icons.pool_rounded;
      default:
        return Icons.business_rounded;
    }
  }
}

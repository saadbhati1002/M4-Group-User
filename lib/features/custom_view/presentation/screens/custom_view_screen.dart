import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/customization_model.dart';
import '../../../../widgets/luxury_drawer.dart';
import '../widgets/custom_view_widgets.dart';

class CustomViewScreen extends StatefulWidget {
  const CustomViewScreen({super.key});

  @override
  State<CustomViewScreen> createState() => _CustomViewScreenState();
}

class _CustomViewScreenState extends State<CustomViewScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = CustomizationCategory.mockCategories;

    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      drawer: const LuxuryDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Parallax Hero
          SliverToBoxAdapter(
            child: CustomHeroSection(scrollOffset: _scrollOffset),
          ),
          // Intro Section
          const SliverToBoxAdapter(
            child: CustomIntroSection(),
          ),
          // Grid Section
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 40),
            sliver: SliverToBoxAdapter(
              child: CustomGridSection(categories: categories),
            ),
          ),
        ],
      ),
    );
  }
}

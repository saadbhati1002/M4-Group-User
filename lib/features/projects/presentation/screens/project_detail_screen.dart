import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/project_model.dart';
import '../../../../data/models/property_detail_model.dart';
import '../widgets/luxury_property_widgets.dart';

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;
  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  late PropertyDetailModel _detailedData;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // In a real app, we would fetch detailed data here.
    // For now, we use the mock data which includes the project info.
    _detailedData = PropertyDetailModel.mock();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.luxuryBlack,
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Section (Project Overview with big image)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 40),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: PropertyOverviewSection(data: _detailedData),
                  ),
                ),
              ),

              // Stats counter section
              SliverToBoxAdapter(
                child: FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: StatsCounterSection(stats: _detailedData.stats),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 60)),

              // Gallery section
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: GalleryGridSection(
                      gallery: _detailedData.detailedGallery),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 60)),

              // Virtual Tour Section
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: VirtualTourSection(data: _detailedData.virtualTour),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 60)),

              // Custom Finishing Section
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: CustomFinishingSection(
                      data: _detailedData.customFinishing),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 60)),

              // Testimonial Section
              SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: TestimonialCarouselSection(
                    testimonials: _detailedData.testimonials,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 80)),

              // Footer / RERA
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: GoldDivider(),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'RERA: ${_detailedData.project.rera}',
                      style: const TextStyle(
                        color: AppTheme.softGrey,
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),

          // Luxury Header with Back button and Title
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                bottom: 15,
                left: 20,
                right: 20,
              ),
              color: AppTheme.luxuryBlack.withValues(alpha: 0.9),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.primaryGold.withValues(alpha: 0.3),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.primaryGold, size: 18),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    _detailedData.project.name.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

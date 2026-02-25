import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/splash/presentation/screens/onboarding_screen.dart';
import '../../features/about/presentation/screens/about_screen.dart';
import '../../features/services/presentation/screens/services_screen.dart';
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/projects/presentation/screens/project_detail_screen.dart';
import '../../features/gallery/presentation/screens/gallery_screen.dart';
import '../../features/contact/presentation/screens/contact_screen.dart';
import '../../features/blog/presentation/screens/blog_screen.dart';
import '../../features/career/presentation/screens/career_screen.dart';
import '../../data/models/project_model.dart';

import '../../features/misc/presentation/screens/placeholder_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppConstants.splash,
  routes: [
    GoRoute(
      path: AppConstants.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppConstants.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppConstants.about,
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: AppConstants.services,
      builder: (context, state) => const ServicesScreen(),
    ),
    GoRoute(
      path: AppConstants.projects,
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(
      path: AppConstants.projectsOngoing,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Ongoing Projects'),
    ),
    GoRoute(
      path: AppConstants.projectsCompleted,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Completed Projects'),
    ),
    GoRoute(
      path: AppConstants.projectDetail,
      builder: (context, state) {
        final project = state.extra as ProjectModel;
        return ProjectDetailScreen(project: project);
      },
    ),
    GoRoute(
      path: AppConstants.gallery,
      builder: (context, state) => const GalleryScreen(),
    ),
    GoRoute(
      path: AppConstants.contact,
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: AppConstants.blog,
      builder: (context, state) => const BlogScreen(),
    ),
    GoRoute(
      path: AppConstants.career,
      builder: (context, state) => const CareerScreen(),
    ),
    GoRoute(
      path: AppConstants.inquiry,
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: AppConstants.customView,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Custom View'),
    ),
    GoRoute(
      path: AppConstants.m4Family,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'M4 Family'),
    ),
    GoRoute(
      path: AppConstants.ourBusiness,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Our Business'),
    ),
    GoRoute(
      path: AppConstants.visionMission,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Vision & Mission'),
    ),
    GoRoute(
      path: AppConstants.media,
      builder: (context, state) =>
          const LuxuryPlaceholderScreen(title: 'Media'),
    ),
  ],
);

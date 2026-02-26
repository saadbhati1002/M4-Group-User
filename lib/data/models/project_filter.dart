enum ProjectFilter {
  all,
  ongoing,
  completed,
}

extension ProjectFilterExtension on ProjectFilter {
  String get displayName {
    switch (this) {
      case ProjectFilter.all:
        return 'All Projects';
      case ProjectFilter.ongoing:
        return 'Ongoing Projects';
      case ProjectFilter.completed:
        return 'Completed Projects';
    }
  }

  String get slug {
    switch (this) {
      case ProjectFilter.all:
        return 'all';
      case ProjectFilter.ongoing:
        return 'ongoing';
      case ProjectFilter.completed:
        return 'completed';
    }
  }

  static ProjectFilter fromSlug(String? slug) {
    if (slug == null) return ProjectFilter.all;
    return ProjectFilter.values.firstWhere(
      (e) => e.slug == slug.toLowerCase(),
      orElse: () => ProjectFilter.all,
    );
  }
}

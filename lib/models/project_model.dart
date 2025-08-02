class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String role;
  final bool isCurrent;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.role,
    this.isCurrent = false,
  });
}

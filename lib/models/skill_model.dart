class Skill {
  final String name;
  final String iconPath;
  final double level; // Value between 0 and 1 representing skill level

  const Skill({
    required this.name,
    required this.iconPath,
    required this.level,
  });
}

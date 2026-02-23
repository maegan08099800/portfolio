import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rizzamae_portfolio/models/skill_model.dart';
import 'package:rizzamae_portfolio/theme/app_theme.dart';
import 'package:rizzamae_portfolio/theme/animated_tech_background.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';
import 'package:rizzamae_portfolio/widgets/skill_chip.dart' hide GlassCard;

import '../widgets/portfolio_page_shell.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  final List<Skill> technicalSkills = const [
    Skill(name: 'Flutter', iconPath: 'assets/icons/flutter.svg', level: 0.85),
    Skill(name: 'Dart', iconPath: 'assets/icons/dart.svg', level: 0.8),
    Skill(name: 'Java', iconPath: 'assets/icons/java.svg', level: 0.75),
    Skill(name: 'PHP', iconPath: 'assets/icons/php.svg', level: 0.7),
    Skill(
        name: 'JavaScript',
        iconPath: 'assets/icons/javascript.svg',
        level: 0.8),
    Skill(name: 'HTML/CSS', iconPath: 'assets/icons/html.svg', level: 0.9),
    Skill(name: 'SQL/MySQL', iconPath: 'assets/icons/mysql.svg', level: 0.8),
    Skill(name: 'C#', iconPath: 'assets/icons/csharp.svg', level: 0.7),
    Skill(
        name: 'Angular JS', iconPath: 'assets/icons/angular.svg', level: 0.65),
    Skill(
        name: 'Bootstrap', iconPath: 'assets/icons/bootstrap.svg', level: 0.85),
    Skill(name: 'jQuery', iconPath: 'assets/icons/jquery.svg', level: 0.75),
    Skill(
        name: 'Oracle PL/SQL', iconPath: 'assets/icons/oracle.svg', level: 0.7),
  ];

  final List<String> tools = const [
    'Visual Studio',
    'Android Studio',
    'VS Code',
    'GitHub',
    'GitLab',
    'Postman',
    'APEX',
    'XAMPP',
    'Firebase',
    'Xcode',
  ];

  final List<String> otherSkills = const [
    'UI/UX Design',
    'Graphic Design',
    'Photo Editing (Photoshop)',
    'Mockups (Figma)',
    'Video Editing',
    'Microsoft Office',
    'ERP Systems',
    'Logistics Management',
  ];

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(currentRoute: route),
      body: PortfolioPageShell(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PageHeader(
                  title: 'Skills & Technologies',
                  subtitle:
                      'My toolkit for building apps, interfaces, and systems.',
                  badge: 'STACK',
                ),
                const SizedBox(height: 14),
                const _SectionTitle(
                  title: 'Programming Languages & Frameworks',
                  hint: 'Core development skills',
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children:
                      technicalSkills.map((s) => SkillChip(skill: s)).toList(),
                ),
                const SizedBox(height: 18),
                const _SectionTitle(
                    title: 'Tools & Platforms',
                    hint: 'Daily drivers & services'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tools
                      .map((t) => Chip(
                            avatar: Icon(Icons.terminal_rounded,
                                size: 16, color: cs.primary),
                            label: Text(t,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 18),
                const _SectionTitle(
                    title: 'Other Skills', hint: 'Support strengths'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: otherSkills
                      .map((s) => Chip(
                            avatar: Icon(Icons.auto_awesome_rounded,
                                size: 16, color: cs.secondary),
                            label: Text(s,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _SectionTitle(
                          title: 'Languages Spoken', hint: 'Communication'),
                      SizedBox(height: 10),
                      _LangRow(label: 'English', level: 'Fluent'),
                      SizedBox(height: 8),
                      _LangRow(label: 'Tagalog', level: 'Fluent'),
                      SizedBox(height: 8),
                      _LangRow(label: 'Hiligaynon', level: 'Native'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.title,
    required this.subtitle,
    required this.badge,
  });

  final String title;
  final String subtitle;
  final String badge;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: LinearGradient(
                colors: [
                  cs.primary.withOpacity(0.85),
                  cs.secondary.withOpacity(0.85)
                ],
              ),
            ),
            child: Text(
              badge,
              style: GoogleFonts.robotoMono(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: cs.onBackground.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.hint});

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        Text(
          hint,
          style: GoogleFonts.robotoMono(
            fontSize: 11,
            color: cs.onBackground.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class _LangRow extends StatelessWidget {
  const _LangRow({required this.label, required this.level});

  final String label;
  final String level;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(Icons.language_rounded, size: 18, color: cs.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(label,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        ),
        Text(
          level,
          style: GoogleFonts.robotoMono(
            fontSize: 12,
            color: cs.onBackground.withOpacity(0.75),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rizzamae_portfolio/screens/about_screen.dart';
import 'package:rizzamae_portfolio/screens/contact_screen.dart';
import 'package:rizzamae_portfolio/screens/experience_screen.dart';
import 'package:rizzamae_portfolio/screens/projects_screen.dart';
import 'package:rizzamae_portfolio/screens/skills_screen.dart';

import 'package:rizzamae_portfolio/theme/app_theme.dart';
import 'package:rizzamae_portfolio/theme/animated_tech_background.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';

import '../widgets/skill_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;

    return Scaffold(
      appBar: CustomAppBar(currentRoute: route),
      body: AnimatedTechBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1080),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _Hero(),
                  SizedBox(height: 16),
                  _StatsRow(),
                  SizedBox(height: 18),
                  _NavGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isMobile = MediaQuery.of(context).size.width < 760;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: isMobile ? 84 : 120,
            height: isMobile ? 84 : 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: cs.primary.withOpacity(0.65)),
              boxShadow: [
                BoxShadow(
                  color: cs.primary.withOpacity(0.25),
                  blurRadius: 22,
                  spreadRadius: 2,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, I'm Rizza Mae 👋",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.w700,
                    color: cs.onBackground,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "I build mobile & web experiences with clean UI and reliable logic.",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 13 : 14,
                    height: 1.45,
                    color: cs.onBackground.withOpacity(0.85),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Role:",
                      style: GoogleFonts.robotoMono(
                        fontSize: 12,
                        color: cs.onBackground.withOpacity(0.65),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Web & Mobile Developer',
                            textStyle: GoogleFonts.robotoMono(
                              fontSize: 13,
                              color: cs.primary,
                              fontWeight: FontWeight.w700,
                            ),
                            speed: const Duration(milliseconds: 70),
                          ),
                          TypewriterAnimatedText(
                            'UI/UX Designer',
                            textStyle: GoogleFonts.robotoMono(
                              fontSize: 13,
                              color: cs.secondary,
                              fontWeight: FontWeight.w700,
                            ),
                            speed: const Duration(milliseconds: 70),
                          ),
                          TypewriterAnimatedText(
                            'Flutter Developer',
                            textStyle: GoogleFonts.robotoMono(
                              fontSize: 13,
                              color: cs.tertiary,
                              fontWeight: FontWeight.w700,
                            ),
                            speed: const Duration(milliseconds: 70),
                          ),
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 800),
                        isRepeatingAnimation: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _PrimaryCTA(
                      label: "Explore Portfolio",
                      icon: Icons.arrow_forward_rounded,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AboutScreen()),
                      ),
                    ),
                    _GhostCTA(
                      label: "Contact",
                      icon: Icons.email_outlined,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ContactScreen()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryCTA extends StatelessWidget {
  const _PrimaryCTA({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

class _GhostCTA extends StatelessWidget {
  const _GhostCTA({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: cs.onBackground),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: cs.onBackground,
        side: BorderSide(color: cs.outline.withOpacity(0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 760;

    const items = [
      _StatItem(
          title: "Focus", value: "Flutter", subtitle: "Mobile-first apps"),
      _StatItem(title: "Stack", value: "Full UI", subtitle: "Design → Code"),
      _StatItem(title: "Style", value: "Clean", subtitle: "Maintainable code"),
    ];

    if (isMobile) {
      return Column(
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: e,
                ))
            .toList(),
      );
    }

    return Row(
      children: items
          .map((e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: e,
                ),
              ))
          .toList()
        ..removeLast(),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [
                  cs.primary.withOpacity(0.85),
                  cs.secondary.withOpacity(0.85),
                ],
              ),
            ),
            child: const Icon(Icons.bolt_rounded, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.robotoMono(
                    fontSize: 11,
                    letterSpacing: 0.8,
                    color: cs.onBackground.withOpacity(0.65),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: cs.onBackground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: cs.onBackground.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NavGrid extends StatelessWidget {
  const _NavGrid();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 760 ? 1 : 2;

    final items = [
      _NavItem("About Me", "Profile, background, and goal",
          Icons.person_outline, const AboutScreen()),
      _NavItem("Experience", "Work history + trainings", Icons.work_outline,
          const ExperienceScreen()),
      _NavItem("Skills", "Tech stack + tools", Icons.code_rounded,
          const SkillsScreen()),
      _NavItem("Projects", "Selected work and roles", Icons.apps_rounded,
          const ProjectsScreen()),
      _NavItem("Contact", "Send a message & links",
          Icons.alternate_email_rounded, const ContactScreen()),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: cols == 1 ? 2.9 : 3.2,
      ),
      itemBuilder: (_, i) => _NavCard(item: items[i]),
    );
  }
}

class _NavItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;
  _NavItem(this.title, this.subtitle, this.icon, this.page);
}

class _NavCard extends StatelessWidget {
  const _NavCard({required this.item});
  final _NavItem item;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => item.page)),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: cs.outline.withOpacity(0.45)),
                color: cs.surface.withOpacity(0.35),
              ),
              child: Icon(item.icon, color: cs.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: cs.onBackground,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: cs.onBackground.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_rounded,
                color: cs.onBackground.withOpacity(0.75)),
          ],
        ),
      ),
    );
  }
}

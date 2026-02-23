import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioDrawer extends StatelessWidget {
  final String? currentRoute;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const PortfolioDrawer({
    super.key,
    required this.currentRoute,
    required this.themeMode,
    required this.onThemeChanged,
  });

  bool _isSelected(String? route, String target) => route == target;

  void _go(BuildContext context, String route) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(route);
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to open link')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: cs.outline.withOpacity(0.35)),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: cs.surface,
                    child: Icon(Icons.person, color: cs.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rizza Mae Gancioso",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Web & Mobile Developer",
                          style: GoogleFonts.robotoMono(
                            fontSize: 11,
                            color: cs.onBackground.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _DrawerItem(
                    icon: Icons.home_rounded,
                    title: "Home",
                    selected: _isSelected(currentRoute, "/"),
                    onTap: () => _go(context, "/"),
                  ),
                  _DrawerItem(
                    icon: Icons.person_outline,
                    title: "About",
                    selected: _isSelected(currentRoute, "/about"),
                    onTap: () => _go(context, "/about"),
                  ),
                  _DrawerItem(
                    icon: Icons.work_outline,
                    title: "Experience",
                    selected: _isSelected(currentRoute, "/experience"),
                    onTap: () => _go(context, "/experience"),
                  ),
                  _DrawerItem(
                    icon: Icons.code_rounded,
                    title: "Skills",
                    selected: _isSelected(currentRoute, "/skills"),
                    onTap: () => _go(context, "/skills"),
                  ),
                  _DrawerItem(
                    icon: Icons.apps_rounded,
                    title: "Projects",
                    selected: _isSelected(currentRoute, "/projects"),
                    onTap: () => _go(context, "/projects"),
                  ),
                  _DrawerItem(
                    icon: Icons.alternate_email_rounded,
                    title: "Contact",
                    selected: _isSelected(currentRoute, "/contact"),
                    onTap: () => _go(context, "/contact"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                    child: Divider(color: cs.outline.withOpacity(0.35)),
                  ),
                  _DrawerItem(
                    icon: Icons.download_rounded,
                    title: "Download CV",
                    subtitle: "PDF / Resume link",
                    selected: false,
                    onTap: () =>
                        _openUrl(context, "https://example.com/cv.pdf"),
                  ),
                  _DrawerItem(
                    icon: Icons.link_rounded,
                    title: "GitHub",
                    subtitle: "Projects & repos",
                    selected: false,
                    onTap: () => _openUrl(context, "https://github.com/"),
                  ),
                  _DrawerItem(
                    icon: Icons.badge_rounded,
                    title: "LinkedIn",
                    subtitle: "Professional profile",
                    selected: false,
                    onTap: () => _openUrl(context, "https://linkedin.com/"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                    child: Divider(color: cs.outline.withOpacity(0.35)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      leading: Icon(
                        themeMode == ThemeMode.dark
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                        color: cs.primary,
                      ),
                      title: Text(
                        "Theme",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        themeMode == ThemeMode.dark ? "Dark" : "Light",
                        style: GoogleFonts.robotoMono(
                          fontSize: 11,
                          color: cs.onBackground.withOpacity(0.7),
                        ),
                      ),
                      trailing: Switch(
                        value: themeMode == ThemeMode.dark,
                        onChanged: (v) => onThemeChanged(
                          v ? ThemeMode.dark : ThemeMode.light,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "© ${DateTime.now().year} Rizza Mae • Built with Flutter",
                style: GoogleFonts.robotoMono(
                  fontSize: 10,
                  color: cs.onBackground.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: selected ? cs.primary : cs.onBackground),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w800,
          fontSize: 13.5,
          color: selected ? cs.primary : cs.onBackground,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: GoogleFonts.robotoMono(
                fontSize: 10.5,
                color: cs.onBackground.withOpacity(0.7),
              ),
            ),
      selected: selected,
      onTap: onTap,
    );
  }
}

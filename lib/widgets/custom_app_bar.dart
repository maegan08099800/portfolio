import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/theme/portfolio_theme_scope.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? currentRoute;

  const CustomAppBar({
    super.key,
    required this.currentRoute,
  });

  bool _isSelected(String? route, String target) => route == target;

  void _go(BuildContext context, String route) {
    if (_isSelected(currentRoute, route)) return;
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final w = MediaQuery.of(context).size.width;

    final bool isDesktop = w >= 900;

    final themeScope = PortfolioThemeScope.of(context);
    final isDark = themeScope.themeMode == ThemeMode.dark;

    final navItems = <_NavAction>[
      _NavAction('Home', '/', Icons.home_rounded),
      _NavAction('About', '/about', Icons.person_outline),
      _NavAction('Experience', '/experience', Icons.work_outline),
      _NavAction('Skills', '/skills', Icons.code_rounded),
      _NavAction('Projects', '/projects', Icons.apps_rounded),
      _NavAction('Contact', '/contact', Icons.alternate_email_rounded),
    ];

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        'Rizza Mae',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w800,
          fontSize: 16,
          color: cs.onBackground,
        ),
      ),
      actions: [
        if (!isDesktop) ...[
          Builder(
            builder: (ctx) => IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 6),
        ] else ...[
          ...navItems.map((item) {
            final selected = _isSelected(currentRoute, item.route);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextButton.icon(
                onPressed: () => _go(context, item.route),
                icon: Icon(
                  item.icon,
                  size: 18,
                  color:
                      selected ? cs.primary : cs.onBackground.withOpacity(0.85),
                ),
                label: Text(
                  item.label,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 12.5,
                    color: selected
                        ? cs.primary
                        : cs.onBackground.withOpacity(0.85),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 8),
          IconButton(
            tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
            icon: Icon(
                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
            onPressed: () => themeScope.setThemeMode(
              isDark ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _NavAction {
  final String label;
  final String route;
  final IconData icon;
  _NavAction(this.label, this.route, this.icon);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onMenuPressed,
    this.currentRoute,
  });

  final VoidCallback? onMenuPressed;
  final String? currentRoute;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isMobile = MediaQuery.of(context).size.width < 760;

    return AppBar(
      title: Row(
        children: [
          Text(
            'Rizza Mae',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
              color: cs.onBackground,
            ),
          ),
          Text(
            ' Gancioso',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
              color: cs.primary,
            ),
          ),
          const SizedBox(width: 10),
          _RolePill(text: 'Web • Mobile • Flutter', color: cs.secondary),
        ],
      ),
      actions: [
        if (isMobile)
          IconButton(
            icon: Icon(Icons.menu_rounded, color: cs.onBackground),
            onPressed: onMenuPressed ??
                () {
                  Scaffold.of(context).openEndDrawer();
                },
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                _NavBtn(text: 'Home', route: '/', currentRoute: currentRoute),
                _NavBtn(
                    text: 'About', route: '/about', currentRoute: currentRoute),
                _NavBtn(
                    text: 'Experience',
                    route: '/experience',
                    currentRoute: currentRoute),
                _NavBtn(
                    text: 'Skills',
                    route: '/skills',
                    currentRoute: currentRoute),
                _NavBtn(
                    text: 'Projects',
                    route: '/projects',
                    currentRoute: currentRoute),
                _NavBtn(
                    text: 'Contact',
                    route: '/contact',
                    currentRoute: currentRoute),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _RolePill extends StatelessWidget {
  const _RolePill({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: cs.outline.withOpacity(0.45)),
        color: cs.surface.withOpacity(0.45),
      ),
      child: Text(
        text,
        style: GoogleFonts.robotoMono(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  const _NavBtn({
    required this.text,
    required this.route,
    required this.currentRoute,
  });

  final String text;
  final String route;
  final String? currentRoute;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final active = currentRoute == route;

    return TextButton(
      onPressed: () {
        if (!active) Navigator.pushNamed(context, route);
      },
      style: TextButton.styleFrom(
        foregroundColor: active ? cs.primary : cs.onBackground.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: active ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }
}

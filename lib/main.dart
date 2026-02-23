import 'package:flutter/material.dart';
import 'package:rizzamae_portfolio/theme/app_theme.dart';
import 'package:rizzamae_portfolio/theme/portfolio_theme_scope.dart';

import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _mode = ThemeMode.dark;

  void _setTheme(ThemeMode mode) => setState(() => _mode = mode);

  @override
  Widget build(BuildContext context) {
    return PortfolioThemeScope(
      themeMode: _mode,
      setThemeMode: _setTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: _mode,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/about': (_) => const AboutScreen(),
          '/experience': (_) => const ExperienceScreen(),
          '/skills': (_) => const SkillsScreen(),
          '/projects': (_) => const ProjectsScreen(),
          '/contact': (_) => const ContactScreen(),
        },
      ),
    );
  }
}

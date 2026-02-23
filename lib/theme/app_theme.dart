import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color neonCyan = Color(0xFF4DF3FF);
  static const Color neonPurple = Color(0xFF8B5CF6);
  static const Color neonPink = Color(0xFFFF4DCD);

  static ThemeData dark() {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.dark);

    const cs = ColorScheme.dark(
      primary: neonCyan,
      secondary: neonPurple,
      tertiary: neonPink,
      background: Color(0xFF0B1220),
      onBackground: Color(0xFFE5E7EB),
      surface: Color(0xFF0F172A),
      onSurface: Color(0xFFE5E7EB),
      outline: Color(0xFF273244),
    );

    return base.copyWith(
      colorScheme: cs,
      scaffoldBackgroundColor: cs.background,
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: cs.onBackground,
        displayColor: cs.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: cs.onBackground,
        ),
        iconTheme: IconThemeData(color: cs.onBackground),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: cs.surface.withOpacity(0.55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: cs.outline.withOpacity(0.35)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: cs.outline.withOpacity(0.45),
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: cs.surface.withOpacity(0.60),
        side: BorderSide(color: cs.outline.withOpacity(0.35)),
        labelStyle: GoogleFonts.poppins(fontSize: 12, color: cs.onBackground),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: Colors.black,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.onBackground,
          side: BorderSide(color: cs.outline.withOpacity(0.50)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  static ThemeData light() {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.light);

    const cs = ColorScheme.light(
      primary: Color(0xFF6A4CFF),
      secondary: Color(0xFF00B8D4),
      tertiary: Color(0xFF00C896),
      background: Color(0xFFF6F7FB),
      onBackground: Color(0xFF0E1320),
      surface: Colors.white,
      onSurface: Color(0xFF0E1320),
      outline: Color(0xFFE1E5ED),
    );

    return base.copyWith(
      colorScheme: cs,
      scaffoldBackgroundColor: cs.background,
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: cs.onBackground,
        displayColor: cs.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: cs.onBackground,
        ),
        iconTheme: IconThemeData(color: cs.onBackground),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: cs.surface.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: cs.outline.withOpacity(0.85)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: cs.outline.withOpacity(0.85),
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: cs.surface,
        side: BorderSide(color: cs.outline.withOpacity(0.85)),
        labelStyle: GoogleFonts.poppins(fontSize: 12, color: cs.onBackground),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.onBackground,
          side: BorderSide(color: cs.outline.withOpacity(0.90)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final glassColor =
        isDark ? cs.surface.withOpacity(0.55) : cs.surface.withOpacity(0.82);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: glassColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: cs.outline.withOpacity(isDark ? 0.35 : 0.85),
            ),
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

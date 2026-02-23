import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Neon accents (still elegant, not “too gamer”)
  static const Color neonCyan = Color(0xFF4DF3FF);
  static const Color neonPurple = Color(0xFF8B5CF6);
  static const Color neonPink = Color(0xFFFF4DCD);

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );

    final cs = const ColorScheme.dark(
      primary: neonCyan,
      secondary: neonPurple,
      tertiary: neonPink,
      surface: Color(0xFF0F172A), // slate-900-ish
      onSurface: Color(0xFFE5E7EB),
      background: Color(0xFF0B1220),
      onBackground: Color(0xFFE5E7EB),
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
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w700,
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
      chipTheme: ChipThemeData(
        backgroundColor: cs.surface.withOpacity(0.6),
        side: BorderSide(color: cs.outline.withOpacity(0.35)),
        labelStyle: GoogleFonts.poppins(fontSize: 12, color: cs.onBackground),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      dividerTheme: DividerThemeData(
        color: cs.outline.withOpacity(0.45),
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cs.surface.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: cs.outline.withOpacity(0.35)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: cs.outline.withOpacity(0.35)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              BorderSide(color: cs.primary.withOpacity(0.9), width: 1.4),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: Colors.black,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

/// Subtle “dev grid” + gradient glow background wrapper
class TechBackground extends StatelessWidget {
  final Widget child;
  const TechBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // Base gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.7, -0.85),
                radius: 1.2,
                colors: [
                  cs.primary.withOpacity(0.22),
                  cs.secondary.withOpacity(0.10),
                  cs.background,
                ],
                stops: const [0, 0.35, 1],
              ),
            ),
          ),
        ),

        // Corner glow
        Positioned(
          right: -120,
          top: -120,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  cs.tertiary.withOpacity(0.22),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Grid overlay
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _GridPainter(
                color: cs.outline.withOpacity(0.22),
              ),
            ),
          ),
        ),

        // Content
        child,
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const step = 28.0;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Glass card wrapper (blur + border)
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cs.surface.withOpacity(0.55),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: cs.outline.withOpacity(0.35)),
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

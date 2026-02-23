import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/models/skill_model.dart';
import 'package:rizzamae_portfolio/theme/app_theme.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;
  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final pct = (skill.level * 100).round();

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cs.surface.withOpacity(0.35),
              border: Border.all(color: cs.outline.withOpacity(0.35)),
            ),
            child: SvgPicture.asset(
              skill.iconPath,
              colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skill.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                "$pct%",
                style: GoogleFonts.robotoMono(
                  fontSize: 11,
                  color: cs.onBackground.withOpacity(0.70),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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

    return Tooltip(
      message: '${(skill.level * 100).toInt()}% proficiency',
      textStyle: GoogleFonts.robotoMono(color: cs.onBackground),
      decoration: BoxDecoration(
        color: cs.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outline.withOpacity(0.6)),
      ),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: cs.surface.withOpacity(0.50),
          border: Border.all(color: cs.outline.withOpacity(0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: cs.outline.withOpacity(0.45)),
                    color: cs.background.withOpacity(0.35),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      skill.iconPath,
                      width: 18,
                      height: 18,
                      placeholderBuilder: (_) =>
                          Icon(Icons.code_rounded, size: 18, color: cs.primary),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    skill.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: cs.onBackground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: skill.level,
                minHeight: 8,
                backgroundColor: cs.outline.withOpacity(0.25),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.lerp(
                      AppTheme.neonCyan, AppTheme.neonPurple, skill.level)!,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${(skill.level * 100).toInt()}%',
              style: GoogleFonts.robotoMono(
                fontSize: 11,
                color: cs.onBackground.withOpacity(0.7),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/models/skill_model.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${(skill.level * 100).toInt()}% proficiency',
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              skill.iconPath,
              width: 40,
              height: 40,
              placeholderBuilder: (context) => const Icon(Icons.code, size: 40),
            ),
            const SizedBox(height: 5),
            Text(
              skill.name,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: skill.level,
              backgroundColor: Colors.grey.shade200,
              color: Colors.purple,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
          ],
        ),
      ),
    );
  }
}

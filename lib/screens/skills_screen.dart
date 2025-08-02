import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/models/skill_model.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';
import 'package:rizzamae_portfolio/widgets/skill_chip.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  final List<Skill> technicalSkills = const [
    Skill(name: 'Flutter', iconPath: 'assets/icons/flutter.svg', level: 0.85),
    Skill(name: 'Dart', iconPath: 'assets/icons/dart.svg', level: 0.8),
    Skill(name: 'Java', iconPath: 'assets/icons/java.svg', level: 0.75),
    Skill(name: 'PHP', iconPath: 'assets/icons/php.svg', level: 0.7),
    Skill(
        name: 'JavaScript',
        iconPath: 'assets/icons/javascript.svg',
        level: 0.8),
    Skill(name: 'HTML/CSS', iconPath: 'assets/icons/html.svg', level: 0.9),
    Skill(name: 'SQL/MySQL', iconPath: 'assets/icons/mysql.svg', level: 0.8),
    Skill(name: 'C#', iconPath: 'assets/icons/csharp.svg', level: 0.7),
    Skill(
        name: 'Angular JS', iconPath: 'assets/icons/angular.svg', level: 0.65),
    Skill(
        name: 'Bootstrap', iconPath: 'assets/icons/bootstrap.svg', level: 0.85),
    Skill(name: 'jQuery', iconPath: 'assets/icons/jquery.svg', level: 0.75),
    Skill(
        name: 'Oracle PL/SQL', iconPath: 'assets/icons/oracle.svg', level: 0.7),
  ];

  final List<String> tools = const [
    'Visual Studio',
    'Android Studio',
    'VS Code',
    'GitHub',
    'GitLab',
    'Postman',
    'APEX',
    'XAMPP',
    'Firebase',
    'Xcode',
  ];

  final List<String> otherSkills = const [
    'UI/UX Design',
    'Graphic Design',
    'Photo Editing (Photoshop)',
    'Mockups (Figma)',
    'Video Editing',
    'Microsoft Office',
    'ERP Systems',
    'Logistics Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills & Technologies',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Programming Languages & Frameworks',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: technicalSkills
                  .map((skill) => SkillChip(skill: skill))
                  .toList(),
            ),
            const SizedBox(height: 30),
            Text(
              'Tools & Platforms',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tools
                  .map((tool) => Chip(
                        label: Text(tool),
                        backgroundColor: Colors.blue.shade100,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            Text(
              'Other Skills',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: otherSkills
                  .map((skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Colors.green.shade100,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Languages Spoken',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/english.svg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'English - Fluent',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tagalog.svg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Tagalog - Fluent',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/hiligaynon.svg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Hiligaynon - Native',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

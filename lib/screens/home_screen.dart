import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/screens/about_screen.dart';
import 'package:rizzamae_portfolio/screens/contact_screen.dart';
import 'package:rizzamae_portfolio/screens/experience_screen.dart';
import 'package:rizzamae_portfolio/screens/projects_screen.dart';
import 'package:rizzamae_portfolio/screens/skills_screen.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple.shade100,
                    Colors.purple.shade50,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Rizza Mae Gancioso',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Web & Mobile Developer',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX Designer',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: Text(
                      'Explore My Portfolio',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Navigation Cards
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildNavCard(
                    context,
                    'About Me',
                    Icons.person,
                    Colors.purple.shade100,
                    const AboutScreen(),
                  ),
                  const SizedBox(height: 20),
                  _buildNavCard(
                    context,
                    'Experience',
                    Icons.work,
                    Colors.blue.shade100,
                    const ExperienceScreen(),
                  ),
                  const SizedBox(height: 20),
                  _buildNavCard(
                    context,
                    'Skills',
                    Icons.code,
                    Colors.green.shade100,
                    const SkillsScreen(),
                  ),
                  const SizedBox(height: 20),
                  _buildNavCard(
                    context,
                    'Projects',
                    Icons.apps,
                    Colors.orange.shade100,
                    const ProjectsScreen(),
                  ),
                  const SizedBox(height: 20),
                  _buildNavCard(
                    context,
                    'Contact',
                    Icons.email,
                    Colors.red.shade100,
                    const ContactScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavCard(BuildContext context, String title, IconData icon,
      Color color, Widget screen) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.purple),
              const SizedBox(width: 20),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

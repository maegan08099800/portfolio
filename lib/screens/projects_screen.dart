import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/models/project_model.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';
import 'package:rizzamae_portfolio/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  final List<Project> projects = const [
    Project(
      name: 'Lupark - Smart Parking',
      description:
          'A mobile application for smart parking solutions that helps users find and reserve parking spots efficiently.',
      technologies: ['Flutter', 'Firebase', 'Dart'],
      role: 'Mobile Developer',
      isCurrent: true,
    ),
    Project(
      name: 'Luvpark for Client',
      description:
          'Client-specific version of the Lupark application with customized features and branding.',
      technologies: ['Flutter', 'Firebase', 'Dart'],
      role: 'Mobile Developer',
      isCurrent: true,
    ),
    Project(
      name: 'GC&C Internship Projects',
      description:
          'Various projects completed during internship including UI design, web development, and IT support tasks.',
      technologies: ['HTML', 'CSS', 'JavaScript', 'C#'],
      role: 'UI Designer/Web Developer',
      isCurrent: false,
    ),
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
              'Projects',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Here are some of the projects I\'ve worked on:',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ...projects.map((project) => Column(
                  children: [
                    ProjectCard(project: project),
                    const SizedBox(height: 20),
                  ],
                )),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Management Systems',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildSystemItem(
                      'Logistics Management System',
                      'Developed during my time at Homeworld Constructions to manage inventory, shipments, and warehouse operations.',
                    ),
                    const Divider(),
                    _buildSystemItem(
                      'ERP System Integration',
                      'Worked with ERP systems to streamline business processes and generate operational reports.',
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

  Widget _buildSystemItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ],
    );
  }
}

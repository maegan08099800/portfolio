import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/models/experience_model.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';
import 'package:rizzamae_portfolio/widgets/experience_card.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  final List<Experience> experiences = const [
    Experience(
      company: 'CMDSI',
      position: 'Web & Mobile Developer',
      period: 'November 2023 - Present',
      location: 'Bacolod, Philippines',
      responsibilities: [
        'Design and develop scalable, secure, and efficient web and mobile applications',
        'Collaborate with cross-functional teams to deliver high-quality solutions',
        'Conduct code reviews and perform testing and debugging',
        'Create and maintain comprehensive documentation',
        'Stay updated with latest trends and technologies',
      ],
      logoPath: 'assets/images/cmdsi_logo.png',
    ),
    Experience(
      company: 'Homeworld Constructions',
      position: 'Logistics Generalist',
      period: 'June 2023 - November 2023',
      location: 'Bacolod City, Philippines',
      responsibilities: [
        'Coordinated daily logistics and supply chain operations',
        'Maintained optimal inventory levels, reducing discrepancies by 15%',
        'Scheduled and tracked inbound/outbound shipments',
        'Supported warehouse activities',
        'Utilized ERP and logistics systems',
        'Contributed to cost-reduction initiatives',
      ],
      logoPath: 'assets/images/homeworld_logo.png',
    ),
    Experience(
      company: 'GC&C Group of Companies, Inc',
      position: 'UI Designer/Web Developer (Intern)',
      period: 'March 2023 - June 2023',
      location: 'Bacolod City, Philippines',
      responsibilities: [
        'IT Support',
        'Quality Assurance',
        'Graphic Design',
      ],
      logoPath: 'assets/images/gc&c_logo.png',
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
              'Professional Experience',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            ...experiences.map((exp) => Column(
                  children: [
                    ExperienceCard(experience: exp),
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
                      'Trainings & Seminars',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildTrainingItem(
                      'Laravel PHP Framework V12 Training',
                      'Nexova IT Solutions',
                      'May 14-17, 2025',
                      'Bata Conference Room, GC&C Bacolod City',
                    ),
                    const Divider(),
                    _buildTrainingItem(
                      'Data-Driven Governance Rollout Training',
                      'Engr. Elmer D. Prudente',
                      'March 27-31, 2023',
                      'Zoom Conference',
                    ),
                    const Divider(),
                    _buildTrainingItem(
                      'Work Attitude and Values Enhancement (WAVE) Training',
                      'GC&C Group of Companies',
                      'September 19, 2024',
                      'Bata Conference Room, GC&C Bacolod City',
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

  Widget _buildTrainingItem(
      String title, String conductor, String date, String venue) {
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
          'Conductor: $conductor',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        Text(
          'Date: $date',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        Text(
          'Venue: $venue',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ],
    );
  }
}

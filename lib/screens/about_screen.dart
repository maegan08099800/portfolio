import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              'About Me',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            Text(
              'Rizza Mae Gancioso',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Web & Mobile Developer',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Career Objective',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Seeking another opportunity to gain more experience, work on new projects, collaborate with teammates, and satisfy customers. I have faced and overcome various challenges and pressures while completing projects. I am eager to contribute my skills to the company\'s growth.',
                      style: GoogleFonts.poppins(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildInfoRow('Date of Birth:', 'August 9, 1998'),
                    _buildInfoRow('Place of Birth:', 'Iloilo City'),
                    _buildInfoRow('Age:', '26 years old'),
                    _buildInfoRow('Civil Status:', 'Single'),
                    _buildInfoRow('Religion:', 'Baptist'),
                    _buildInfoRow('Gender:', 'Female'),
                    _buildInfoRow('Citizenship:', 'Filipino'),
                    _buildInfoRow('Languages:', 'English, Tagalog, Hiligaynon'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Education',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildEducationItem(
                      'Carlos Hilado Memorial State University',
                      'Bacolod City, Philippines',
                      '2019-2022',
                    ),
                    const Divider(),
                    _buildEducationItem(
                      'Technological Foundation Institute',
                      'Bago City, Philippines',
                      '2018-2019',
                      isHighSchool: true,
                    ),
                    const Divider(),
                    _buildEducationItem(
                      'Faith Christian School',
                      'Bago City, Philippines',
                      '2014-2015',
                      isHighSchool: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildContactItem(
                      Icons.location_on,
                      'Hda. Guba, Brgy. Alijis, Valladolid, Negros Occidental',
                    ),
                    const SizedBox(height: 10),
                    _buildContactItem(
                      Icons.phone,
                      '+63 998 043 3230',
                      isPhone: true,
                    ),
                    const SizedBox(height: 10),
                    _buildContactItem(
                      Icons.email,
                      'ganciosomae@gmail.com',
                      isEmail: true,
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(String institution, String location, String years,
      {bool isHighSchool = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          location,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        Text(
          isHighSchool ? 'Senior Highschool' : 'College',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          years,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text,
      {bool isPhone = false, bool isEmail = false}) {
    return InkWell(
      onTap: () async {
        if (isPhone) {
          final uri = Uri.parse('tel:$text');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        } else if (isEmail) {
          final uri = Uri.parse('mailto:$text');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

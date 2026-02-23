import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rizzamae_portfolio/widgets/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/portfolio_theme_scope.dart';
import '../widgets/portfolio_drawer.dart';
import '../widgets/portfolio_page_shell.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    final themeScope = PortfolioThemeScope.of(context);

    return Scaffold(
      appBar: CustomAppBar(currentRoute: route),
      endDrawer: PortfolioDrawer(
        currentRoute: route,
        themeMode: themeScope.themeMode,
        onThemeChanged: themeScope.setThemeMode,
      ),
      body: PortfolioPageShell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get In Touch',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildContactItem(
                      Icons.location_on,
                      'Hda. Guba, Brgy. Alijis, Valladolid, Negros Occidental',
                    ),
                    const SizedBox(height: 20),
                    _buildContactItem(
                      Icons.phone,
                      '+63 998 043 3230',
                      isPhone: true,
                    ),
                    const SizedBox(height: 20),
                    _buildContactItem(
                      Icons.email,
                      'ganciosomae@gmail.com',
                      isEmail: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Send me a message',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message sent successfully!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, size: 30),
                  color: Colors.blue,
                  onPressed: () async {
                    const url = 'https://facebook.com';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.link, size: 30),
                  color: Colors.purple,
                  onPressed: () async {
                    const url = 'https://linkedin.com';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.code, size: 30),
                  color: Colors.black,
                  onPressed: () async {
                    const url = 'https://github.com';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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

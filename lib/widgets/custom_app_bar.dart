import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          Text(
            'Rizza Mae',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          Text(
            ' Gancioso',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        // Mobile view - hamburger menu
        if (MediaQuery.of(context).size.width < 600)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.purple),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          )
        else
          // Desktop view - navigation links
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildNavButton(context, 'Home', Icons.home, '/'),
                const SizedBox(width: 10),
                _buildNavButton(context, 'About', Icons.person, '/about'),
                const SizedBox(width: 10),
                _buildNavButton(
                    context, 'Experience', Icons.work, '/experience'),
                const SizedBox(width: 10),
                _buildNavButton(context, 'Skills', Icons.code, '/skills'),
                const SizedBox(width: 10),
                _buildNavButton(context, 'Projects', Icons.apps, '/projects'),
                const SizedBox(width: 10),
                _buildNavButton(context, 'Contact', Icons.email, '/contact'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildNavButton(
      BuildContext context, String text, IconData icon, String route) {
    final isCurrent = ModalRoute.of(context)?.settings.name == route;
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: isCurrent ? Colors.purple : Colors.grey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (!isCurrent) {
          Navigator.pushNamed(context, route);
        }
      },
      icon: Icon(icon, size: 18),
      label: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

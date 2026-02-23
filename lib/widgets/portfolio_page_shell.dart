import 'package:flutter/material.dart';
import 'package:rizzamae_portfolio/theme/animated_tech_background.dart';

class PortfolioPageShell extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const PortfolioPageShell({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTechBackground(
      child: SingleChildScrollView(
        padding: padding,
        child: child,
      ),
    );
  }
}

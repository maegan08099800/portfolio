import 'package:flutter/material.dart';

class PortfolioThemeScope extends InheritedWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> setThemeMode;

  const PortfolioThemeScope({
    super.key,
    required this.themeMode,
    required this.setThemeMode,
    required super.child,
  });

  static PortfolioThemeScope of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<PortfolioThemeScope>();
    assert(scope != null, 'PortfolioThemeScope not found above in widget tree');
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant PortfolioThemeScope oldWidget) {
    return oldWidget.themeMode != themeMode;
  }
}

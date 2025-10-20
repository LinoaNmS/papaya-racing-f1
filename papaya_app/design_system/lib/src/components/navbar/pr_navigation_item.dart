import 'package:flutter/material.dart';

class PRNavigationBarItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;

  const PRNavigationBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}

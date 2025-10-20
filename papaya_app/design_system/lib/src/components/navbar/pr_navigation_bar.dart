import 'package:design_system/src/components/navbar/pr_navigation_item.dart';
import 'package:flutter/material.dart';

class PRNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<PRNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  const PRNavigationBar({
    super.key,
    this.currentIndex = 0,
    required this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              activeIcon: item.activeIcon != null
                  ? Icon(item.activeIcon)
                  : null,
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}

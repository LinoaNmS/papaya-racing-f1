import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PRCard extends StatelessWidget {
  final VoidCallback? onTap;
  final List<Widget> body;
  final bool hasAccent;
  final F1TeamColors? accentColor;

  const PRCard({
    super.key,
    this.onTap,
    required this.body,
    this.hasAccent = false,
    this.accentColor,
  });

  factory PRCard.withAccent({
    VoidCallback? onTap,
    required List<Widget> body,
    required F1TeamColors accentColor,
  }) {
    return PRCard(
      onTap: onTap,
      body: body,
      hasAccent: true,
      accentColor: accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: hasAccent
                ? Border(
                    left: BorderSide(
                      color: hasAccent
                          ? accentColor?.primary ?? Colors.blue
                          : Colors.transparent,
                      width: 4,
                    ),
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: body,
          ),
        ),
      ),
    );
  }
}

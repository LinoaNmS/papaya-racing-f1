import 'package:flutter/material.dart';

class PRBadge extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final BoxShape shape;
  const PRBadge({
    super.key,
    required this.body,
    required this.backgroundColor,
    this.shape = BoxShape.rectangle,
  });

  factory PRBadge.circle({
    required Widget body,
    required Color color,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return PRBadge(
      body: body,
      shape: BoxShape.circle,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape,

        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(8)
            : null,
      ),
      child: body,
    );
  }
}

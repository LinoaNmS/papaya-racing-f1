import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart'; // où se trouve ton F1ThemeProvider

class PRButton extends StatelessWidget {
  final String text;
  final Color color;
  final PRButtonSize size;
  final PRButtonVariant variant;
  final Icon? icon;
  final VoidCallback? onPressed;

  const PRButton({
    super.key,
    required this.text,
    required this.color,
    this.size = PRButtonSize.medium,
    this.variant = PRButtonVariant.filled,
    this.icon,
    this.onPressed,
  });

  /// 🔹 Bouton primaire basé sur le thème courant
  factory PRButton.primary(
    BuildContext context, {
    required String text,
    PRButtonSize size = PRButtonSize.medium,
    PRButtonVariant variant = PRButtonVariant.filled,
    Icon? icon,
    Key? key,
    VoidCallback? onPressed,
  }) {
    final theme = context.f1Theme;
    return PRButton(
      key: key,
      text: text,
      color: theme.primary,
      size: size,
      variant: variant,
      icon: icon,
      onPressed: onPressed,
    );
  }

  /// 🔹 Bouton secondaire basé sur le thème courant
  factory PRButton.secondary(
    BuildContext context, {
    required String text,
    PRButtonSize size = PRButtonSize.medium,
    PRButtonVariant variant = PRButtonVariant.filled,
    Icon? icon,
    Key? key,
    VoidCallback? onPressed,
  }) {
    final theme = context.f1Theme;
    return PRButton(
      key: key,
      text: text,
      color: theme.secondary,
      size: size,
      variant: variant,
      icon: icon,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [icon!, const SizedBox(width: 8), Text(text)],
            )
          : Text(text),
    );
  }

  Color f1TextColorOn(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}

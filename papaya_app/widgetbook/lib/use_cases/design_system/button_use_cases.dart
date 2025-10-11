import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/design_system.dart';

@widgetbook.UseCase(name: 'Default', type: PRButton)
Widget prButtonDefault(BuildContext context) {
  return PRButton.primary(
    context,
    text: context.knobs.string(label: 'Title label', initialValue: 'Click me'),
    variant: context.knobs.object.dropdown(
      label: 'Variant',
      options: PRButtonVariant.values,
      labelBuilder: (variant) => variant.name,
    ),
    onPressed: () => {},
  );
}

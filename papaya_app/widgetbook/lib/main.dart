import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system/design_system.dart';

import 'main.directories.g.dart';

void main() {
  runApp(F1ThemeProvider(theme: F1Theme.mclaren, child: F1WidgetbookApp()));
}

@widgetbook.App()
class F1WidgetbookApp extends StatelessWidget {
  const F1WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, F1TeamColors> f1Teams = {
      'McLaren': F1TeamColors.mclaren,
      'Red Bull': F1TeamColors.redBull,
      'Ferrari': F1TeamColors.ferrari,
      'Mercedes': F1TeamColors.mercedes,
      'Aston Martin': F1TeamColors.astonMartin,
      'Alpine': F1TeamColors.alpine,
      'Williams': F1TeamColors.williams,
      'Haas': F1TeamColors.haas,
      'RB': F1TeamColors.rb,
      'Sauber': F1TeamColors.sauber,
    };

    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: f1Teams.entries.map((entry) {
            return WidgetbookTheme(
              name: entry.key,
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: entry.value.primary,
                  primary: entry.value.primary,
                  secondary: entry.value.secondary,
                ),
                useMaterial3: true,
                fontFamily: 'Inter',
              ),
            );
          }).toList(),
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyNote20,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        TextScaleAddon(scales: [0.8, 1.0, 1.2, 1.5, 2.0]),
        AlignmentAddon(),
      ],
      appBuilder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
    );
  }
}

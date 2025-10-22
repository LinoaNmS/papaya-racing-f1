import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver.dart';

class DriverProfilScreen extends StatelessWidget {
  final Driver driver;
  const DriverProfilScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: F1SemanticColors.grey100,
      appBar: AppBar(
        title: Text('Profile driver'),
        backgroundColor: F1TeamColors.mclaren.primary,
      ),
      body: Center(
        child: Column(
          children: [
            PRAvatar(
              imageUrl:
                  "https://www.formula1.com/content/dam/fom-website/drivers/O/OSCPIA01_Oscar_Piastri/oscpia01.png.transform/1col/image.png",
            ),
            Text("Oscar Piastri"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papaya_racing/features/standing/presentation/pages/standing.screen.dart';
import 'injection_container.dart' as di; // ⬅️ AJOUTÉ

void main() async {
  // ⬅️ AJOUTÉ async
  // ⚠️ OBLIGATOIRE pour SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();

  // ⚠️ CRITIQUE : Initialiser GetIt
  await di.init();

  runApp(F1ThemeProvider(theme: F1Theme.mclaren, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Papaya Racing',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.comfortaaTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Standings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: F1TeamColors.mclaren.primary,
      ),
      backgroundColor: F1SemanticColors.grey100,
      body: const StandingScreen(), // ⬅️ Ajouté const
    );
  }
}

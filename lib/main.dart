import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_test_app/screens/main_gate.dart';
import 'package:sputnik_test_app/screens/onboarding.dart';
import 'package:sputnik_test_app/services/constans.dart';

late SharedPreferences ref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: ProjectColors.background,
      ),
      home: ref.getBool('onboarding') ?? false
          ? const MainGate()
          : const OnboardingScreen(),
    );
  }
}

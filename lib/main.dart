import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const UrduQuranApp());
}

class UrduQuranApp extends StatelessWidget {
  const UrduQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urdu Quran',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF007BFF),
        scaffoldBackgroundColor: const Color(0xFF000000),
        fontFamily: 'OpenSans', // You can add your preferred font here
      ),
      home: const SplashScreen(),
    );
  }
}

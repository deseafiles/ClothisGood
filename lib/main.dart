import 'package:android/ui/home/home_screen.dart';
import 'package:android/ui/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:android/ui/splash/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:android/routing/router.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ClothisGood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.pink)),
      routerConfig: router,
    );
  }
}

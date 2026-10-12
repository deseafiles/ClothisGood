import 'package:flutter/material.dart';
import 'package:android/ui/home/widgets/navigation_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavigationAppBar(),
      body: Column(
        children: [
          Center(
            child: Text('Setting page'),  
          )
        ],
      )
    );
  }
}

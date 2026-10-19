import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';

class SettingBarItem extends StatelessWidget {
  final Icon icon;
  final String name;
  final Widget action; 

  const SettingBarItem({super.key, required this.icon, required this.name, required this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: Row(
          spacing: 4,
          children: [
            icon,
            Expanded(flex: 1, child: Text(name, style: TextStyle(fontSize: 16, fontFamily: 'Inter', color: AppColors.textPrimary))),
            action
          ],
        )
      ) 
    );
  }
}

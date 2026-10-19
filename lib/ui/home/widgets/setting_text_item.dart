
import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';

class SettingTextItem extends StatelessWidget {
  final String? name;
  final VoidCallback? onPressed;
  final IconButton icon;

  const SettingTextItem({
    super.key,
    this.name,
    this.onPressed,
    this.icon = const IconButton(
      onPressed: null,
      icon: Icon(
        Icons.arrow_right,
        size: 30,
        color: AppColors.primary,
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            color: AppColors.textSecondary,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: icon.icon,
        ),
      ],
    );
  }
}

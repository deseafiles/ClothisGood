import 'package:flutter/material.dart';
import 'package:android/utils/constant.dart';

class SettingBarItem extends StatelessWidget {
  final Icon icon;
  final String name;
  final String? value;
  final VoidCallback? onPressed;
  final Widget? action;

  const SettingBarItem({
    super.key,
    required this.icon,
    required this.name,
    this.value,
    this.onPressed,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: Row(
            spacing: 8,
            children: [
              icon,
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (action != null)
                action!
              else if (value != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        color: AppColors.textSecondary,
                      ),
                    ),
                    if (onPressed != null)
                      const Icon(
                        Icons.arrow_right,
                        size: 30,
                        color: AppColors.primary,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

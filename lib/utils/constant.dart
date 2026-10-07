import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const primary = Color(0xFF9E2D55);
  static const primaryLight = Color(0xFFB83D68);

  // Pink
  static const pink = Color(0xFFF8ACBC);
  static const pinkLight = Color(0xFFFBDCE3);

  // Background
  static const background = Color(0xFFFFF7F9);
  static const surface = Color(0xFFFFFFFF);

  // Text
  static const textPrimary = Color(0xFF3F1728);
  static const textSecondary = Color(0xFF8A6472);
  static const textWhite = Color(0xFFFFFFFF);

  // Border
  static const border = Color(0xFFF1D5DD);
}

class AppSpacing {
  AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 24.0;
  static const xxxl = 32.0;
  static const huge = 40.0;
}

class AppRadius {
  AppRadius._();

  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const full = 999.0;
}

class AppShadows {
  AppShadows._();

  static const card = [
    BoxShadow(
      color: Color(0x12000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];
}

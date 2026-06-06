import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPink = Color(0xFFFF66FF);
  static const Color primaryPurple = Color(0xFF8A2BE2);
  static const Color darkBlue = Color(0xFF181461);
  static const Color lightGray = Color(0xFFECF1FA);
  static const Color backgroundGray = Color(0xFFF8FAFF);
  static const Color userBubbleGradientStart = Color(0xFF8A2BE2);
  static const Color userBubbleGradientEnd = Color(0xFF6A1B9A);
  static const Color botBubbleColor = Color(0xFFE8EAF6);
}

class AppStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkBlue,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBlue,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );

  static final InputDecoration textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryPurple, width: 1),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  );
}

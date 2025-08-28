import 'package:flutter/material.dart';
import 'package:demo_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.spotifyGreen,
        onPrimary: Colors.black,
        secondary: Colors.white,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.onBg,
        displayColor: AppColors.onBg,
      ),
    );
  }
}

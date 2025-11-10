import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';

class AppTheme {

  static final apptheme=ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    brightness: Brightness.dark,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      contentTextStyle: TextStyle(
        color: Colors.white
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondBackgroundColor,
      hintStyle: TextStyle(
        color: Colors.grey[300],
        fontWeight: FontWeight.w300
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        )
      )
    )



  );
}
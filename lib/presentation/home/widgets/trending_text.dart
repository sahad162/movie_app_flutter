import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Trending',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColors.primaryColor
    ),);
  }
}
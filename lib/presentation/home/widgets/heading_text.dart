import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';

class HeadingText extends StatelessWidget {
  final String  text;
  const HeadingText({
  required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20 , top: 3),
      child: Text(
        text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white
      ),),
    );
  }
}
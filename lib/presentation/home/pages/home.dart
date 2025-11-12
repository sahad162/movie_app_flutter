import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/images/app_images.dart';
import 'package:movie_app/presentation/home/widgets/trending.dart';
import 'package:movie_app/presentation/home/widgets/trending_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:BasicAppbar(
        hideBack: true,
        leading: Padding(padding: 
        const EdgeInsets.only(left: 10),
        child: Image.asset(AppImages.splashBackground),
        ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TrendingText(),
              ),
              Trending()
            ],
          ),
        ),
        

      );
       
    
  }
}
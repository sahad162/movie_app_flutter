import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/images/app_images.dart';
import 'package:movie_app/presentation/home/widgets/heading_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing.dart';
import 'package:movie_app/presentation/home/widgets/trending.dart';


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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(text: "Trending"),
                Trending(),
                SizedBox(height: 20,),
                HeadingText(text: "Now Playing"),
                SizedBox(height: 20,),
                NowPlaying(),
                SizedBox(height: 30,)
          
          
              ],
            ),
          ),
        ),
        

      );
       
    
  }
}
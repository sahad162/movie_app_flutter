import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/images/app_images.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit,SplashState>(
        listener: (context, state) {
          if(state is UnAuthenticated){
            AppNavigator.pushReplacement(context, SignInPage());
          }
          if(state is Authenticated){
           AppNavigator.pushReplacement(context, HomePage());

          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: 
            AssetImage(AppImages.splashBackground),
            fit: BoxFit.contain)
        
          ),
        ),
      ),

    );
  }
}
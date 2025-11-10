import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/auth/usecases/isloggedin.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';
import 'package:movie_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState>{

  SplashCubit() : super(DisplaySplashScreen());

  Future <void> appStarted() async{
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn=await sl<Isloggedin>().call();
    if(isLoggedIn){
      emit(Authenticated());
     }
     else{
      emit(UnAuthenticated());
     }
  }

}

import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/isloggedin.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';

final sl=GetIt.instance;

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

//services
  sl.registerSingleton<Authapi>(AuthApiService());

//Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

//usecase
  sl.registerSingleton<Signup>(Signup());
  sl.registerSingleton<SignIn>(SignIn());
  sl.registerSingleton<Isloggedin>(Isloggedin());
}
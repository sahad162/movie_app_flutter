
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api.dart';
import 'package:movie_app/data/movie/repositories/movie_repository_imp.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecases/isloggedin.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/movie/usecases/now_playing_usecases.dart';

final sl=GetIt.instance;

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

//services
  sl.registerSingleton<Authapi>(AuthApiService());
  sl.registerSingleton<MovieService>(MovieApiService());

//Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImp());

//usecase
  sl.registerSingleton<Signup>(Signup());
  sl.registerSingleton<SignIn>(SignIn());
  sl.registerSingleton<Isloggedin>(Isloggedin());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<NowPlayingUsecases>(NowPlayingUsecases());
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/presentation/home/bloc/trending_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {

  TrendingMovieCubit():super(TrendingMovieLoading());

  void getTrendingMovies()async{
    var returnedData=await sl<GetTrendingMoviesUsecase>().call();
    returnedData.fold(
     (error){
      emit(FailureLoadTrendingMovies(errorMessage: error));
     },(data){
      emit(TrendingMoviesLoaded(movies: data));
     }
    
     );
  }
}
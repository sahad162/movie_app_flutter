import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/now_playing_usecases.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {

  NowPlayingMovieCubit():super(NowPlayingMovieLoading());

  void getNowPlayingMovies()async{
    var returnedData=await sl<NowPlayingUsecases>().call();
    returnedData.fold(
     (error){
      emit(FailureLoadNowPlayingMovies(errorMessage: error));
     },(data){
      emit(NowPlayingMoviesLoaded(movies: data));
     }
    
     );
  }
}
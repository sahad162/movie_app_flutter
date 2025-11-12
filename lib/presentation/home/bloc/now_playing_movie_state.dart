import 'package:movie_app/domain/movie/entities/movie_entitie.dart';

class NowPlayingMovieState {}

class NowPlayingMovieLoading extends NowPlayingMovieState{}

class NowPlayingMoviesLoaded extends NowPlayingMovieState{
  final List<MovieEntitie> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadNowPlayingMovies extends NowPlayingMovieState{
  final String errorMessage;

  FailureLoadNowPlayingMovies({required this.errorMessage});

}
import 'package:movie_app/domain/auth/entities/movie_entitie.dart';

abstract class TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState{}

class TrendingMoviesLoaded extends TrendingMovieState{
  final List<MovieEntitie> movies;

  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadTrendingMovies extends TrendingMovieState{
  final String errorMessage;

  FailureLoadTrendingMovies({required this.errorMessage});

}
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/useCase/usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/service_locator.dart';

class GetTrendingMoviesUsecase extends UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
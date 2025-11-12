import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future <Either> getNowPlayingMovies();
  Future <Either> watchTrailer(int movieId);
}

class MovieApiService extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getNowPlayingMovies()  async{
    try {
      var response=await sl<DioClient>().get(
        ApiUrl.nowplayingmovies
      );

      return Right(response.data);
      
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> watchTrailer(int movieId) async {
     try {
      var response=await sl<DioClient>().get(
        '${ApiUrl.watchTrailer}${movieId}/trailer',
      );

      return Right(response.data);
      
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

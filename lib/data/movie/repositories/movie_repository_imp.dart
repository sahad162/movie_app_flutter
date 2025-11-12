import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImp extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnData= await sl<MovieService>().getTrendingMovies();
    return returnData.fold(
      (error){
      return Left(error);
    },
    (data){
      var movies= List.from(data['content']).map((item)=>MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    }
    );
  }
  
  @override
  Future<Either> getNowPlayingMovies() async{

    var returnData=await sl<MovieService>().getNowPlayingMovies();
    

    return returnData.fold((error){
      return Left(error);
    }, (data){

      var nowPlayingMovies=List.from(data['content']).map((item)=>MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(nowPlayingMovies);

    }

    );
  }
  
  @override
  Future<Either> watchTrailer(int movieId) {
    // TODO: implement watchTrailer
    throw UnimplementedError();
  }
  
}
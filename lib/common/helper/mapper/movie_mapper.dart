import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/domain/auth/entities/movie_entitie.dart';

class MovieMapper {

  static MovieEntitie toEntity(MovieModel movie){
    return MovieEntitie(adult: movie.adult, 
    backdropPath:movie. backdropPath,
     id: movie.id, 
     title: movie.title, 
     originalTitle: movie.originalTitle,
      overview: movie.overview,
       posterPath: movie.posterPath,
        mediaType: movie.mediaType,
         originalLanguage: movie.originalLanguage,
          genreIds: movie.genreIds,
           popularity: movie.popularity,
            releaseDate: movie.releaseDate,
             video: movie.video,
              voteAverage: movie.voteAverage, 
              voteCount: movie.voteCount);
  }
}
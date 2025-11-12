class MovieModel {
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json["adult"] as bool?,
      backdropPath: json["backdrop_path"] as String?,
      id: json["id"] as int?,
      title: json["title"] as String?,
      originalTitle: json["original_title"] as String?,
      overview: json["overview"] as String?,
      posterPath: json["poster_path"] as String?,
      mediaType: json["media_type"] as String?,
      originalLanguage: json["original_language"] as String?,
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from((json["genre_ids"] as List).map((x) => x as int)),
      popularity: (json["popularity"] as num?)?.toDouble(),
      releaseDate: json["release_date"] != null && json["release_date"] != ""
          ? DateTime.tryParse(json["release_date"])
          : null,
      video: json["video"] as bool?,
      voteAverage: (json["vote_average"] as num?)?.toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }
}

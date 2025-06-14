class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final double popularity;
  final int voteCount;
  final String originalLanguage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.popularity,
    required this.voteCount,
    required this.originalLanguage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? 'Sem título',
      overview: json['overview'] ?? 'Sem descrição disponível.',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? 'Data desconhecida',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      originalLanguage: json['original_language'] ?? 'N/A',
    );
  }
}

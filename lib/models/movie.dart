import 'models.dart';

class Movie {
  Movie({
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  get fullPosterPath {
    if (posterPath == null) {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));


  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? 'https://i.stack.imgur.com/GNhxO.png',
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
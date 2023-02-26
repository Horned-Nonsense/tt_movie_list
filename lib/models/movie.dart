import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'adult')
  final bool? adult;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.posterPath,
    this.adult,
    this.releaseDate,
    this.voteAverage,
  });

  const Movie.empty()
      : id = 0,
        title = '',
        overview = '',
        genreIds = const [],
        posterPath = '',
        adult = null,
        releaseDate = null,
        voteAverage = null;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

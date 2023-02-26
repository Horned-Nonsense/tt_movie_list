import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'popular_movies.g.dart';

@JsonSerializable()
class PopularMovies {
  @JsonKey(name: 'results')
  final List<Movie> movies;

  const PopularMovies({
    required this.movies,
  });

  factory PopularMovies.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesFromJson(json);
}

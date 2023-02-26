import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'genres.g.dart';

@JsonSerializable()
class Genres {
  final List<Genre> genres;

  const Genres({required this.genres});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}

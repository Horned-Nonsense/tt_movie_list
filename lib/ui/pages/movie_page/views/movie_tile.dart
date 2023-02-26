import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../api/network_constants.dart';
import '../../../../models/genre.dart';
import '../../../../models/movie.dart';
import '../../../styles/movie_text_style.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;
  final VoidCallback? onTap;

  const MovieTile({
    super.key,
    required this.movie,
    required this.genres,
    this.onTap,
  });

  String getMovieGenres() {
    List<int> genresIds = List.from(movie.genreIds);
    List<String> movieGenres = [];

    for (Genre genre in genres) {
      if (genresIds.contains(genre.id)) {
        if (movieGenres.length == 4) break;
        movieGenres.add(genre.name);
      }
    }

    return movieGenres.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final int generatedColorIndex = Random().nextInt(Colors.primaries.length);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.primaries[generatedColorIndex].withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPoster(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: _buildMovieInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        '${NetworkConstants.imageBaseUrl}${movie.posterPath}',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMovieInfo() {
    final List<String> releaseYear = movie.releaseDate.split('-');
    final genres = getMovieGenres();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          style: MovieTextStyle.tileMoviesNameTextStyle,
        ),
        const SizedBox(height: 8),
        Text(
          genres,
          overflow: TextOverflow.ellipsis,
          style: MovieTextStyle.tileInfoTextStyle,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              releaseYear[0],
              style: MovieTextStyle.tileInfoTextStyle,
            ),
            Text(
              '${movie.voteAverage}/10',
              style: MovieTextStyle.tileInfoTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

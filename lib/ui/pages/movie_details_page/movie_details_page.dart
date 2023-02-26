import 'dart:math';

import 'package:flutter/material.dart';

import '../../../api/network_constants.dart';
import '../../../models/genre.dart';
import '../../../models/movie.dart';
import '../../styles/movie_text_style.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;

  const MovieDetailsPage({
    super.key,
    required this.movie,
    required this.genres,
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 8,
        ),
        _buildPoster(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: _buildMovieInfo(),
        ),
        _buildMovieDescription(),
      ],
    );
  }

  Widget _buildPoster() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          '${NetworkConstants.imageBaseUrl}${movie.posterPath}',
          scale: 2.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    final genres = getMovieGenres();
    final List<String> releaseYear = movie.releaseDate.split('-');
    return Column(
      children: [
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: MovieTextStyle.moviesNameTextStyle,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              releaseYear[0],
              style: MovieTextStyle.infoTextStyle,
            ),
            Text(
              genres,
              style: MovieTextStyle.infoTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '${movie.voteAverage}/10',
          style: MovieTextStyle.infoTextStyle,
        ),
      ],
    );
  }

  Widget _buildMovieDescription() {
    final int generatedColorIndex = Random().nextInt(Colors.primaries.length);

    return Card(
      elevation: 2,
      color: Colors.primaries[generatedColorIndex].withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          movie.overview,
          textAlign: TextAlign.justify,
          style: MovieTextStyle.infoTextStyle,
        ),
      ),
    );
  }
}

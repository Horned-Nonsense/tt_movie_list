import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../api/models/genres_client.dart';
import '../api/models/popular_movies_client.dart';
import '../models/genre.dart';
import '../models/movie.dart';

class MoviePageController extends GetxController {
  List<Movie> popularMovies = [];
  List<Genre> allGenres = [];

  RxBool isDataLoading = false.obs;
  RxBool pagination = false.obs;

  int movieListPage = 1;
  final dio = Dio();
  final String apiKey = dotenv.get('MOVIE_KEY');

  @override
  Future<void> onInit() async {
    dio.options.headers['Content-Type'] = 'app/json';
    super.onInit();
    await getGenresApi();
    await getMoviesApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getMoviesApi() async {
    final moviesClient = PopularMoviesClient(dio);

    try {
      if (popularMovies.isEmpty) isDataLoading(true);
      if (popularMovies.isNotEmpty) pagination(true);

      await moviesClient.getMovies(apiKey, movieListPage).then((movies) {
        if (popularMovies.isEmpty) {
          popularMovies = List.from(movies.movies);
        } else {
          popularMovies.addAll(movies.movies);
        }
      });
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isDataLoading(false);
      pagination(false);
      movieListPage++;
    }
  }

  getGenresApi() async {
    final genresClient = GenresClient(dio);
    final String apiKey = dotenv.get('MOVIE_KEY');
    try {
      isDataLoading(true);

      await genresClient.getGenres(apiKey).then((genres) {
        allGenres = List.from(genres.genres);
      });
    } catch (e) {
      log('Error while getting data is $e');
    }
  }
}

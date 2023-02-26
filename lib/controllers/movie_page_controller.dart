import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../api/models/genres_client.dart';
import '../api/models/popular_movies_client.dart';
import '../models/genres.dart';
import '../models/popular_movies.dart';

class MoviePageController extends GetxController {
  late PopularMovies popularMovies;
  late Genres allGenres;

  RxBool isDataLoading = false.obs;

  final dio = Dio();

  @override
  Future<void> onInit() async {
    super.onInit();
    getMoviesApi();
    getGenresApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getMoviesApi() async {
    final moviesClient = PopularMoviesClient(dio);
    final genresClient = GenresClient(dio);
    final String apiKey = dotenv.get('MOVIE_KEY');
    try {
      isDataLoading(true);

      await moviesClient.getMovies(apiKey).then((movies) {
        popularMovies = movies;
      });
      await genresClient.getGenres(apiKey).then((genres) {
        allGenres = genres;
      });
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  getGenresApi() async {
    final genresClient = GenresClient(dio);
    final String apiKey = dotenv.get('MOVIE_KEY');
    try {
      isDataLoading(true);

      await genresClient.getGenres(apiKey).then((genres) {
        allGenres = genres;
      });
    } catch (e) {
      log('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}

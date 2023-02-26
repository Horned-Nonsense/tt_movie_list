import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/popular_movies.dart';
import '../network_constants.dart';

part 'popular_movies_client.g.dart';

@RestApi(baseUrl: NetworkConstants.baseUrl)
abstract class PopularMoviesClient {
  factory PopularMoviesClient(Dio dio, {String baseUrl}) = _PopularMoviesClient;

  @GET('${NetworkConstants.getFilms}?${NetworkConstants.apiKey}')
  Future<PopularMovies> getMovies();
}

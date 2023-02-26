import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/genres.dart';
import '../network_constants.dart';

part 'genres_client.g.dart';

@RestApi(baseUrl: NetworkConstants.baseUrl)
abstract class GenresClient {
  factory GenresClient(Dio dio, {String baseUrl}) = _GenresClient;

  @GET('${NetworkConstants.getGenres}${NetworkConstants.apiKey}{apiKey}')
  Future<Genres> getGenres(@Path('apiKey') String apiKey,);
}

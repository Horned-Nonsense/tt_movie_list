import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tt_movie_list/ui/pages/movie_details_page/movie_details_page.dart';

import '../../../controllers/movie_page_controller.dart';
import '../../styles/movie_text_style.dart';
import 'views/movie_tile.dart';

class MoviePage extends StatelessWidget {
  final controller = Get.put(MoviePageController());

  MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
        title: Text(
          'Popular Movies',
          style: MovieTextStyle.appBarTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _buildBody()),
    );
  }

  Widget _buildBody() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: controller.popularMovies.movies.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final movie = controller.popularMovies.movies[index];
        final genres = controller.allGenres.genres;
        return MovieTile(
          movie: movie,
          genres: genres,
          onTap: () {
            Get.to(
              () => MovieDetailsPage(
                movie: movie,
                genres: genres,
              ),
            );
          },
        );
      },
    );
  }
}

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
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        controller.getMoviesApi();
      }
    });

    return Obx(
      () => MasonryGridView.count(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        crossAxisCount: 2,
        itemCount: controller.pagination.value
            ? controller.popularMovies.length + 1
            : controller.popularMovies.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index < controller.popularMovies.length) {
            return _buildTile(index);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildTile(int index) {
    final movie = controller.popularMovies[index];
    final genres = controller.allGenres;

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
  }
}

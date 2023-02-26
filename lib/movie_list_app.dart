import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tt_movie_list/ui/pages/movie_page/movie_page.dart';

class MovieListApp extends StatelessWidget {
  const MovieListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie List',
      debugShowCheckedModeBanner: false,
      home: MoviePage(),
      theme: ThemeData.dark(),
    );
  }
}

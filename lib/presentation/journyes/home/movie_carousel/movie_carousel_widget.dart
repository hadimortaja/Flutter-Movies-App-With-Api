import 'package:flutter/material.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/presentation/blocs/movie_carousel/movie_data_widget.dart';
import 'package:movies_app_api/presentation/widgets/movie_app_bar.dart';
import 'package:movies_app_api/presentation/widgets/separator.dart';

import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget(
      {Key key, @required this.movies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, "default Index Cannot be less than 0"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}

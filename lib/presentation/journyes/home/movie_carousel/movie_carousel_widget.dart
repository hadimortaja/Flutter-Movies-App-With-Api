import 'package:flutter/material.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/presentation/widgets/movie_app_bar.dart';

import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({Key key, 
 @required this.movies,
  @required this.defaultIndex}) :assert(defaultIndex>=0,"default Index Cannot be less than 0"),
   super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieAppBar(),
        MoviePageView(
          movies:movies,
          initialPage:defaultIndex,
        ),
      ],
    );
  }
}

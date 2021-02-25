import 'package:flutter/material.dart';
import 'package:movies_app_api/di/get_it.dart';
import 'package:movies_app_api/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarouselBloc>(
      create: (context) => movieCarouselBloc,
      child: Scaffold(
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
           cubit: movieCarouselBloc, 
        //bloc: movieCarouselBloc,
        builder: (context, state) {
          if (state is MovieCarouselLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.6,
                  child: MovieCarouselWidget(
                    movies:state.movies,
                    defaultIndex:state.defaultIndex,
                  )
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.4,
                  child: Placeholder(
                    color: Colors.grey,
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app_api/di/get_it.dart';
import 'package:movies_app_api/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';
import 'package:movies_app_api/presentation/journyes/drawer/navigation_drawer.dart';

import 'movie_carousel/movie_carousel_widget.dart';
import 'movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabedBloc movieTabedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabedBloc = getItInstance<MovieTabedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
         BlocProvider(
          create: (context) => movieTabedBloc,
        ),

      ],
      child: Scaffold(
        drawer: NavigationDrawer(),
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
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    )),
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.4,
                  child:MovieTabbedWidget()
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

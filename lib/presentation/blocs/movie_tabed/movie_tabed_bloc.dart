import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/domain/entities/no_params.dart';
import 'package:movies_app_api/domain/usecases/get_comming_soon.dart';
import 'package:movies_app_api/domain/usecases/get_playing_now.dart';
import 'package:movies_app_api/domain/usecases/get_popular.dart';

part 'movie_tabed_event.dart';
part 'movie_tabed_state.dart';

class MovieTabedBloc extends Bloc<MovieTabedEvent, MovieTabedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabedBloc(
      {@required this.getPopular,
      @required this.getPlayingNow,
      @required this.getComingSoon})
      : super(MovieTabedInitial());

  @override
  Stream<MovieTabedState> mapEventToState(
    MovieTabedEvent event,
  ) async* {
    if (event is MovieTabedChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
      yield moviesEither.fold(
          (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
          (movies) {
        return MovieTabChanged(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        );
      });
    }
  }
}

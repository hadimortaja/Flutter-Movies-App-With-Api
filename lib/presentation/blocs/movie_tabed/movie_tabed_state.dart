part of 'movie_tabed_bloc.dart';

abstract class MovieTabedState extends Equatable {
  final int currentTabIndex;

  const MovieTabedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabedInitial extends MovieTabedState {}

class MovieTabChanged extends MovieTabedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

      @override
        List<Object> get props => [currentTabIndex,movies];
}
class MovieTabLoadError extends MovieTabedState{
  const MovieTabLoadError({int currentTabIndex}) : super(currentTabIndex: currentTabIndex);
}

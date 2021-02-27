part of 'movie_tabed_bloc.dart';

abstract class MovieTabedEvent extends Equatable {
  const MovieTabedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabedChangedEvent extends MovieTabedEvent {
  final int currentTabIndex;

 const MovieTabedChangedEvent({this.currentTabIndex=0});

 @override
   List<Object> get props => [currentTabIndex];
}

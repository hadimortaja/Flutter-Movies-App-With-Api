import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_api/common/constants/size_constants.dart';
import 'package:movies_app_api/common/constants/translation_constants.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';

import 'package:movies_app_api/common/extensions/size_extensions.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';

import 'package:movies_app_api/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';
import 'package:movies_app_api/presentation/journyes/home/movie_tabbed/movie_listview_builder.dart';
import 'package:movies_app_api/presentation/journyes/home/movie_tabbed/tab_title_widget.dart';
import 'package:movies_app_api/presentation/widgets/app_error_widget.dart';

import 'movie_tabbed_constants.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc
        .add(MovieTabedChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabedBloc, MovieTabedState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Column(children: [
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0;
                        i < MovieTabbedConstants.movieTabs.length;
                        i++)
                      TabTitleWidget(
                        title: MovieTabbedConstants.movieTabs[i].title,
                        onTap: () => _onTabTabbed(i),
                        isSelected: MovieTabbedConstants.movieTabs[i].index ==
                            state.currentTabIndex,
                      )
                  ]),
              if (state is MovieTabChanged)
                state.movies?.isEmpty ?? true
                    ? Expanded(
                        child: Center(
                        child: Text(TranslationConstants.noMovies.t(context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1),
                      ))
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies)),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: () => movieTabbedBloc.add(MovieTabedChangedEvent(
                        currentTabIndex: currentTabIndex)),
                  ),
                )
            ]));
      },
    );
  }

  void _onTabTabbed(int index) {
    movieTabbedBloc.add(MovieTabedChangedEvent(currentTabIndex: index));
  }
}

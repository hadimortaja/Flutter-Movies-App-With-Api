import 'package:flutter/material.dart';
import 'package:movies_app_api/common/constants/translation_constants.dart';
import 'package:movies_app_api/common/extensions/string_extensions.dart';
import 'package:movies_app_api/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/big_poster.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/cast_widget.dart';
import 'package:movies_app_api/presentation/journyes/movie_details/movie_details_arguments.dart';

import '../../../di/get_it.dart';
import '../../blocs/movie_detail/movie_detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key key, @required this.movieDetailArguments})
      : assert(movieDetailArguments != null, "arguments must not be null"),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  CastBloc _castBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _movieDetailBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    CastWidget(),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

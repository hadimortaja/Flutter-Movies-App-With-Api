import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app_api/data/core/api_client.dart';
import 'package:movies_app_api/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories_impl.dart';
import 'package:movies_app_api/domain/usecases/get_cast.dart';
import 'package:movies_app_api/domain/usecases/get_comming_soon.dart';
import 'package:movies_app_api/domain/usecases/get_movies_details.dart';
import 'package:movies_app_api/domain/usecases/get_playing_now.dart';
import 'package:movies_app_api/domain/usecases/get_popular.dart';
import 'package:movies_app_api/domain/usecases/get_trending.dart';
import 'package:movies_app_api/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app_api/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_app_api/presentation/blocs/movie_tabed/movie_tabed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
      getItInstance.registerLazySingleton<GetCast>(
      () => GetCast(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselBloc(
        getTrending: getItInstance(),
        movieBackdropBloc: getItInstance(),
      ));
  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
    () => MovieTabedBloc(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance()),
      
    
  );
  getItInstance
      .registerFactory(() => MovieDetailBloc(
        getMovieDetail: getItInstance(),
        castBloc: getItInstance()
        ));

        getItInstance
      .registerFactory(() => CastBloc(
        getCast: getItInstance()
        ));
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}

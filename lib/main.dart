import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_app_api/data/core/api_client.dart';
import 'package:movies_app_api/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/domain/entities/no_params.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:movies_app_api/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';

import 'domain/repositories/movie_repositories_impl.dart';

Future<void> main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print("error");
      print(l);
    },
    (r) {
      print("List of Movies");
      print(r);
    },

    // final movies
    // if(movies!=null){
    //   //show Ui
    // }else{
    //   //show error message
    // }
    // dataSource.getTrending();
    // dataSource.getPopular();
    // dataSource.getCommingSoon();
    // dataSource.getPlayingNow();
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Container(),
    );
  }
}



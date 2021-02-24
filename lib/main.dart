import 'package:flutter/material.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/domain/entities/no_params.dart';
import 'package:movies_app_api/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  unawaited(getIt.init());
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
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
      home: Scaffold(
        body: Center(child: Text("Movies App"),),
      ),
    );
  }
}

import 'dart:io';

import 'package:movies_app_api/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app_api/data/models/movie_detail_model.dart';
import 'package:movies_app_api/data/models/movie_model.dart';
import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_detail_entity.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception{
            return Left(AppError(AppErrorType.api));

    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getCommingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception{
            return Left(AppError(AppErrorType.api));

    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception{
            return Left(AppError(AppErrorType.api));

    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception{
            return Left(AppError(AppErrorType.api));

    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async{
try {
      final movie = await remoteDataSource.getMovieDetail(id);//////////
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception{
            return Left(AppError(AppErrorType.api));

    }  }
}

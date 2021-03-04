import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_detail_entity.dart';
import 'package:movies_app_api/domain/entities/movie_params.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_api/domain/usecases/usecase.dart';

class GetMovieDetail extends UserCase<MovieDetailEntity,MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

@override
  Future<Either<AppError,MovieDetailEntity>> call(MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}

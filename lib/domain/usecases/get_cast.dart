import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/cast_entity.dart';
import 'package:movies_app_api/domain/entities/movie_params.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_api/domain/usecases/usecase.dart';

class GetCast extends UserCase<List<CastEntity>,MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

@override
  Future<Either<AppError,List<CastEntity>>> call(MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}

import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:movies_app_api/domain/entities/movie_entity.dart';
import 'package:movies_app_api/domain/entities/no_params.dart';
import 'package:movies_app_api/domain/repositories/movie_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_api/domain/usecases/usecase.dart';

class GetPlayingNow extends UserCase<List<MovieEntity>,NoParams>  {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError,List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}

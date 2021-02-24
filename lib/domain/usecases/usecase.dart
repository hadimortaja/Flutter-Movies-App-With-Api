import 'package:movies_app_api/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth_request.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> getLoginData();
  Future<Either<Failure, bool>> checkLogin();
  Future<Either<Failure, void>> login(AuthRequestEntity request);
  Future<Either<Failure, void>> logout();
}

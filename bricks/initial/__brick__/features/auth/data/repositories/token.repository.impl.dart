import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repositories/token.repository.dart';
import '../datasources/token.local.datasource.dart';

class TokenRepositoryImpl extends TokenRepository {
  final TokenLocalDatasource tokenLocalDatasource;

  TokenRepositoryImpl({required this.tokenLocalDatasource});

  @override
  Future<Either<Failure, AuthEntity>> getToken() async {
    try {
      final data = await tokenLocalDatasource.getUserData();

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return const Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}

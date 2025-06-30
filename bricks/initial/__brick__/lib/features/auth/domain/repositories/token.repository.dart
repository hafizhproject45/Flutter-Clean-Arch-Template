import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';

import '../../../../core/errors/failures.dart';

abstract class TokenRepository {
  Future<Either<Failure, AuthEntity>> getToken();
}

import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth_request.entity.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';

class LoginUsecase implements UseCase<void, AuthRequestEntity> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(AuthRequestEntity params) async {
    Either<Failure, void> result = await authRepository.login(params);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

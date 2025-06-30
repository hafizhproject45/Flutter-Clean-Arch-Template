import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';

class GetLoginDataUsecase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository authRepository;

  GetLoginDataUsecase({required this.authRepository});

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) async {
    final loginDataRequest = await authRepository.getLoginData();

    return loginDataRequest.fold((l) => Left(l), (r) => Right(r));
  }
}

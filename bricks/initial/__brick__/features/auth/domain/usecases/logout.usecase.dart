import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    final result = await authRepository.logout();

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

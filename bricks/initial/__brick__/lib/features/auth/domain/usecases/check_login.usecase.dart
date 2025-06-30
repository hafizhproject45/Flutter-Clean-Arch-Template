import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';

class CheckLoginUsecase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  CheckLoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    final result = await authRepository.checkLogin();

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

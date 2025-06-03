import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class Delete{{feat_name.pascalCase()}}Usecase implements UseCase<void, String> {
  final {{feat_name.pascalCase()}}Repository repository;

  Delete{{feat_name.pascalCase()}}Usecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String id) async {
    final result = await repository.delete(id);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

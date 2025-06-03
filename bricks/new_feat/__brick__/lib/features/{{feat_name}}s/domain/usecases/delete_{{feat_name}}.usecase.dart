import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class Delete{{feat_name.pascalCase()}}Usecase implements UseCase<void, int> {
  final {{feat_name.pascalCase()}}Repository {{feat_name}}Repository;

  Delete{{feat_name.pascalCase()}}Usecase({required this.{{feat_name}}Repository});

  @override
  Future<Either<Failure, void>> call(int id) async {
    final result = await {{feat_name}}Repository.delete(id);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

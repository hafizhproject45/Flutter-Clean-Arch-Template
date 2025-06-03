import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class All{{feat_name.pascalCase()}}Usecase implements UseCase<List<{{feat_name.pascalCase()}}Entity>, NoParams> {
  final {{feat_name.pascalCase()}}Repository repository;

  All{{feat_name.pascalCase()}}Usecase({required this.repository});

  @override
  Future<Either<Failure, List<{{feat_name.pascalCase()}}Entity>>> call(NoParams params) async {
    final result = await repository.getAll();

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

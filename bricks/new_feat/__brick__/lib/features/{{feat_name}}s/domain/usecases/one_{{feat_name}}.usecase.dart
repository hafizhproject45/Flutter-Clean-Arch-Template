import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class One{{feat_name.pascalCase()}}Usecase implements UseCase<{{feat_name.pascalCase()}}Entity, String> {
  final {{feat_name.pascalCase()}}Repository repository;

  One{{feat_name.pascalCase()}}Usecase({required this.repository});

  @override
  Future<Either<Failure, {{feat_name.pascalCase()}}Entity>> call(String id) async {
    final result = await repository.getOne(id);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

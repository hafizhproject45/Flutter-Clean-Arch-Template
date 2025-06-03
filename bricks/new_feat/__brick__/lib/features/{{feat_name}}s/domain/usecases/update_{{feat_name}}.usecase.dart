import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}_request.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class Update{{feat_name.pascalCase()}}Usecase implements UseCase<void, {{feat_name.pascalCase()}}RequestEntity> {
  final {{feat_name.pascalCase()}}Repository repository;

  Update{{feat_name.pascalCase()}}Usecase({required this.repository});

  @override
  Future<Either<Failure, void>> call({{feat_name.pascalCase()}}RequestEntity request) async {
    final result = await repository.update(request);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';

import 'package:popy_shop/features/{{feat_name}}s/domain/entities/{{feat_name}}_request.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';

abstract class {{feat_name.pascalCase()}}Repository {
  Future<Either<Failure, List<{{feat_name.pascalCase()}}Entity>>> getAll();
  Future<Either<Failure, {{feat_name.pascalCase()}}Entity>> getOne(String id);
  Future<Either<Failure, void>> create({{feat_name.pascalCase()}}RequestEntity request);
  Future<Either<Failure, void>> update({{feat_name.pascalCase()}}RequestEntity request);
  Future<Either<Failure, void>> delete(String id);
}

import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/helpers/handle_exception.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/data/datasources/{{feat_name}}.datasource.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/data/models/{{feat_name}}_request.model.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}_request.entity.dart';


class {{feat_name.pascalCase()}}RepositoryImpl extends {{feat_name.pascalCase()}}Repository {
  final {{feat_name.pascalCase()}}Datasource datasource;

  {{feat_name.pascalCase()}}RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<{{feat_name.pascalCase()}}Entity>>> getAll() async {
    return await handleException(() async {
      final result = await datasource.getAll();
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, {{feat_name.pascalCase()}}Entity>> getOne(String id) async {
    return await handleException(() async {
      final model = await datasource.getOne(id);
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> create({{feat_name.pascalCase()}}RequestEntity request) async {
    return await handleException(() async {
      final model = {{feat_name.pascalCase()}}RequestModel.fromEntity(request);
      return await datasource.create(model);
    });
  }

  @override
  Future<Either<Failure, void>> update({{feat_name.pascalCase()}}RequestEntity request) async {
    return await handleException(() async {
      final model = {{feat_name.pascalCase()}}RequestModel.fromEntity(request);
      return await datasource.update(model);
    });
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    return await handleException(() async {
      return await datasource.delete(id);
    });
  }
}

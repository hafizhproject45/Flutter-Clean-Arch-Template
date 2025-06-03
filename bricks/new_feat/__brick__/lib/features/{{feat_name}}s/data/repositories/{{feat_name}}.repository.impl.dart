import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/helpers/handle_exception.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/data/datasources/{{feat_name}}.datasource.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/data/models/{{feat_name}}_request.model.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class {{feat_name.pascalCase()}}RepositoryImpl extends {{feat_name.pascalCase()}}Repository {
  final {{feat_name.pascalCase()}}Datasource {{feat_name}}Datasource;

  {{feat_name.pascalCase()}}RepositoryImpl({required this.{{feat_name}}Datasource});

  @override
  Future<Either<Failure, List<{{feat_name.pascalCase()}}Model>>> getAll() async {
    return await handleException(() async {
      return await {{feat_name}}Datasource.getAll();
    });
  }

  @override
  Future<Either<Failure, {{feat_name.pascalCase()}}Model>> getOne(String id) async {
    return await handleException(() async {
      return await {{feat_name}}Datasource.getOne(id);
    });
  }

  @override
  Future<Either<Failure, void>> create({{feat_name.pascalCase()}}RequestModel request) async {
    return await handleException(() async {
      return await {{feat_name}}Datasource.create(request);
    });
  }

  @override
  Future<Either<Failure, void>> update({{feat_name.pascalCase()}}RequestModel request) async {
    return await handleException(() async {
      return await {{feat_name}}Datasource.update(request);
    });
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    return await handleException(() async {
      return await {{feat_name}}Datasource.delete(id);
    });
  }
}

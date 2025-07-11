import 'package:dio/dio.dart';
import 'package:{{project_name}}/core/errors/exceptions.dart';
import 'package:{{project_name}}/services/base_api.dart';
import 'package:{{project_name}}/core/utils/constants.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/data/models/{{feat_name}}.model.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/data/models/{{feat_name}}_request.model.dart';

abstract class {{feat_name.pascalCase()}}Datasource {
  Future<List<{{feat_name.pascalCase()}}Model>> getAll();
  Future<{{feat_name.pascalCase()}}Model> getOne(String id);
  Future<void> create({{feat_name.pascalCase()}}RequestModel request);
  Future<void> update({{feat_name.pascalCase()}}RequestModel request);
  Future<void> delete(String id);
}

class {{feat_name.pascalCase()}}DatasourceImpl extends {{feat_name.pascalCase()}}Datasource {
  final BaseApi baseApi;

  {{feat_name.pascalCase()}}DatasourceImpl({required this.baseApi});

  @override
  Future<List<{{feat_name.pascalCase()}}Model>> getAll() async {
    try {
      final res = await baseApi.get('$BASE_URL/{{feat_name}}s');

      if (res.statusCode == 200) {
        final data =
            (res.data as List).map((x) => {{feat_name.pascalCase()}}Model.fromJson(x)).toList();

        return data;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<{{feat_name.pascalCase()}}Model> getOne(String id) async {
    try {
      final res = await baseApi.get('$BASE_URL/{{feat_name}}s/$id');

      if (res.statusCode == 200) {
        final data = {{feat_name.pascalCase()}}Model.fromJson(res.data);

        return data;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> create({{feat_name.pascalCase()}}RequestModel request) async {
    try {
      await baseApi.post('$BASE_URL/{{feat_name}}s', data: request.toJson());
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> update({{feat_name.pascalCase()}}RequestModel request) async {
    try {
      await baseApi.patch('$BASE_URL/{{feat_name}}s/${request.id}', data: request.toJson());
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await baseApi.delete('$BASE_URL/{{feat_name}}s/$id');
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }
}

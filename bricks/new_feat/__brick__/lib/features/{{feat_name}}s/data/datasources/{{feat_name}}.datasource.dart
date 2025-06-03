import 'package:dio/dio.dart';
import 'package:popy_shop/core/errors/exceptions.dart';
import 'package:popy_shop/services/base_api.dart';
import 'package:popy_shop/core/utils/constants.dart';

import 'package:popy_shop/features/{{feat_name}}s/data/models/{{feat_name}}.model.dart';
import 'package:popy_shop/features/{{feat_name}}s/data/models/{{feat_name}}_request.model.dart';
import 'package:popy_shop/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';

abstract class {{feat_name.pascalCase()}}Datasource {
  Future<List<{{feat_name.pascalCase()}}Model>> getAll();
  Future<{{feat_name.pascalCase()}}Entity> getOne(String id);
  Future<void> create({{feat_name.pascalCase()}}RequestModel params);
  Future<void> update({{feat_name.pascalCase()}}RequestModel params);
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
  Future<{{feat_name.pascalCase()}}Entity> getOne(String id) async {
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
  Future<void> create({{feat_name.pascalCase()}}RequestModel params) async {
    try {
      await baseApi.post('$BASE_URL/{{feat_name}}s', data: params);
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> update({{feat_name.pascalCase()}}RequestModel params) async {
    try {
      await baseApi.patch('$BASE_URL/{{feat_name}}s/${params.id}', data: params);
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

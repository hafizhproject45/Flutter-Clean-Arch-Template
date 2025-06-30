import 'package:dio/dio.dart';
import 'package:{{project_name}}/core/errors/exceptions.dart';
import 'package:{{project_name}}/core/utils/constants.dart';
import 'package:{{project_name}}/features/auth/data/models/auth.model.dart';
import 'package:{{project_name}}/features/auth/data/models/auth_request.model.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';
import 'package:{{project_name}}/services/base_api.dart';

abstract class AuthRemoteDatasource {
  Future<AuthEntity> login(AuthRequestModel request);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final BaseApi baseApi;

  AuthRemoteDatasourceImpl({required this.baseApi});

  @override
  Future<AuthEntity> login(AuthRequestModel request) async {
    try {
      final res = await baseApi.post(
        '$BASE_URL/auth/login',
        isAuth: true,
        data: request.toJson(),
      );

      if (res.statusCode == 200) {
        return AuthModel.fromJson(res.data);
      } else {
        throw AuthException();
      }
    } on DioException catch (e) {
      throw AuthException.fromDioError(e);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }
}

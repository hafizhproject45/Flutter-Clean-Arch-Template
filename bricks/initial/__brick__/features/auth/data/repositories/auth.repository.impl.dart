import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/errors/failures.dart';
import 'package:{{project_name}}/core/helpers/handle_exception.dart';
import 'package:{{project_name}}/features/auth/data/datasources/auth.local.datasource.dart';
import 'package:{{project_name}}/features/auth/data/datasources/auth.remote.datasource.dart';
import 'package:{{project_name}}/features/auth/data/models/auth.model.dart';
import 'package:{{project_name}}/features/auth/data/models/auth_request.model.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth_request.entity.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.authLocalDatasource,
  });

  @override
  Future<Either<Failure, AuthEntity>> getLoginData() async {
    return await handleException(() async {
      return await authLocalDatasource.getLoginData();
    });
  }

  @override
  Future<Either<Failure, bool>> checkLogin() async {
    return await handleException(() async {
      return await authLocalDatasource.checkLogin();
    });
  }

  @override
  Future<Either<Failure, void>> login(AuthRequestEntity request) async {
    return await handleException(() async {
      final requestModel = AuthRequestModel.fromEntity(request);
      final authModel = await authRemoteDatasource.login(requestModel);
      await authLocalDatasource.saveLoginData(authModel as AuthModel);
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return await handleException(() async {
      await authLocalDatasource.deleteLoginData();
    });
  }
}

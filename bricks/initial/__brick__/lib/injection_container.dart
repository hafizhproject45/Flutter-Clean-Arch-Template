import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/features/auth/data/datasources/auth.local.datasource.dart';
import 'package:{{project_name}}/features/auth/data/datasources/auth.remote.datasource.dart';
import 'package:{{project_name}}/features/auth/data/datasources/token.local.datasource.dart';
import 'package:{{project_name}}/features/auth/data/repositories/auth.repository.impl.dart';
import 'package:{{project_name}}/features/auth/data/repositories/token.repository.impl.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/auth.repository.dart';
import 'package:{{project_name}}/features/auth/domain/repositories/token.repository.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/check_login.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/get_login_data.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/login.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/logout.usecase.dart';
import 'package:{{project_name}}/features/auth/presentation/cubit/auth.cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/utils/constants.dart';
import 'core/utils/token_interceptor.dart';
import 'services/base_api.dart';

var sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  //? Token
  sl.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(tokenLocalDatasource: sl()),
  );
  sl.registerLazySingleton<TokenLocalDatasource>(
    () => TokenLocalDatasourceImpl(),
  );

  ///////////////
  ///! External
  ///////////////
  // Dio
  sl.registerSingleton(
    Dio(BaseOptions(baseUrl: BASE_URL))
      ..options.headers['Accept'] = 'application/json'
      ..options.headers['Content-Type'] = 'application/json'
      ..interceptors.addAll([
        if (kDebugMode)
          PrettyDioLogger(
            request: kDebugMode,
            requestHeader: kDebugMode,
            responseHeader: kDebugMode,
            responseBody: kDebugMode,
          ),
        TokenInterceptor(tokenRepository: sl()),
      ]),
  );
  sl.registerSingleton(BaseApi(sl()));

  //! Auth
  //? Datasources
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(baseApi: sl()),
  );
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(),
  );

  //? Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: sl(),
      authLocalDatasource: sl(),
    ),
  );

  //? Usecase
  sl.registerLazySingleton(() => CheckLoginUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => GetLoginDataUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => LoginUsecase(authRepository: sl()));
  sl.registerLazySingleton(() => LogoutUsecase(authRepository: sl()));

  //? Cubit
  sl.registerFactory(
    () => AuthCubit(
      checkLoginUsecase: sl(),
      loginUsecase: sl(),
      logoutUsecase: sl(),
      loginDataUsecase: sl(),
    ),
  );
}

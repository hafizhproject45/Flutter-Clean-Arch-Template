import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/utils/constants.dart';
import 'core/utils/token_interceptor.dart';
import 'data/datasources/auth/auth.local.datasource.dart';
import 'data/datasources/auth/auth.remote.datasource.dart';
import 'data/datasources/auth/token.local.datasource.dart';
import 'data/repositories/auth/auth.repository.impl.dart';
import 'data/repositories/auth/token.repository.impl.dart';
import 'domain/repositories/auth/auth.repository.dart';
import 'domain/repositories/auth/token.repository.dart';
import 'domain/usecases/auth/check_login.usecase.dart';
import 'domain/usecases/auth/get_login_data.usecase.dart';
import 'domain/usecases/auth/login.usecase.dart';
import 'domain/usecases/auth/logout.usecase.dart';
import 'presentation/cubit/auth/get_login_data/get_login_data.cubit.dart';
import 'presentation/cubit/auth/login/login.cubit.dart';
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
}

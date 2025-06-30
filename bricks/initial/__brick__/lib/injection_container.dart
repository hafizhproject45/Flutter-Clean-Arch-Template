import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/utils/constants.dart';
import 'core/utils/token_interceptor.dart';
import 'services/base_api.dart';

import 'package:{{project_name}}/features/auth/domain/repositories/token.repository.dart';
import 'package:{{project_name}}/features/auth/data/repositories/token.repository.impl.dart';
import 'package:{{project_name}}/features/auth/data/datasources/token.local.datasource.dart';

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

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/auth/login.entity.dart';
import '../../domain/repositories/auth/token.repository.dart';
import '../errors/failures.dart';

class TokenInterceptor extends Interceptor {
  final TokenRepository tokenRepository;

  TokenInterceptor({required this.tokenRepository});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Either<Failure, LoginEntity> loginDataRequest =
        await tokenRepository.getToken();

    LoginEntity? loginData;

    loginData = loginDataRequest.fold(
      (l) => loginData = null,
      (r) => loginData = r,
    );

    if (loginData != null) {
      options.headers['Authorization'] = 'Bearer ${loginData!.accessToken}';
      // print("DATA USER LOCAL: $loginData");
    }

    handler.next(options);
  }
}

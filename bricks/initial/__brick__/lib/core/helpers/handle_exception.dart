import 'package:dartz/dartz.dart';

import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../utils/constants.dart';

Future<Either<Failure, T>> handleException<T>(
  Future<T> Function() operation,
) async {
  try {
    final result = await operation();
    return Right(result);
  } on ServerException catch (e) {
    return Left(ServerFailure(message: e.message));
  } on AuthException catch (e) {
    return Left(LoginFailure(message: e.message));
  } on CacheException catch (e) {
    return Left(CacheFailure(message: e.message));
  } on UnknownException catch (e) {
    return Left(UnknownFailure(message: e.message ?? FAILURE_UNKNOWN));
  } on NotFoundException catch (e) {
    return Left(NotFoundFailure(message: e.message));
  } catch (e) {
    return Left(UnknownFailure(message: FAILURE_UNKNOWN));
  }
}

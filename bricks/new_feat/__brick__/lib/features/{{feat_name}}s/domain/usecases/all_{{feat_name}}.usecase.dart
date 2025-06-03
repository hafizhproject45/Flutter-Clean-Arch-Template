import 'package:dartz/dartz.dart';
import 'package:popy_shop/core/errors/failures.dart';
import 'package:popy_shop/core/usecases/usecase.dart';

import 'package:popy_shop/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:popy_shop/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class All{{feat_name.pascalCase()}}Usecase implements UseCase<List<{{feat_name.pascalCase()}}Entity>, NoParams> {
  final {{feat_name.pascalCase()}}Repository {{feat_name}}Repository;

  All{{feat_name.pascalCase()}}Usecase({required this.{{feat_name}}Repository});

  @override
  Future<Either<Failure, List<{{feat_name.pascalCase()}}Entity>>> call(NoParams params) async {
    final result = await {{feat_name}}Repository.getAll();

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

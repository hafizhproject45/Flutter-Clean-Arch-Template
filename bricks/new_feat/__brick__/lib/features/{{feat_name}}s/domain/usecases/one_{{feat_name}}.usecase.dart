import 'package:dartz/dartz.dart';
import 'package:popy_shop/core/errors/failures.dart';
import 'package:popy_shop/core/usecases/usecase.dart';

import 'package:popy_shop/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:popy_shop/features/{{feat_name}}s/domain/repositories/{{feat_name}}.repository.dart';

class One{{feat_name.pascalCase()}}Usecase implements UseCase<{{feat_name.pascalCase()}}Entity, String> {
  final {{feat_name.pascalCase()}}Repository {{feat_name}}Repository;

  One{{feat_name.pascalCase()}}Usecase({required this.{{feat_name}}Repository});

  @override
  Future<Either<Failure, {{feat_name.pascalCase()}}Entity>> call(String id) async {
    final result = await {{feat_name}}Repository.getOne(id);

    return result.fold((f) => Left(f), (v) => Right(v));
  }
}

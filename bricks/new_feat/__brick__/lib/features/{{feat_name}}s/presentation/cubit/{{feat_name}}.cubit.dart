import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popy_shop/core/usecases/usecase.dart';
import 'package:popy_shop/core/utils/constants.dart';

import 'package:popy_shop/features/purchases/domain/entities/purchase.entity.dart';
import 'package:popy_shop/features/purchases/domain/usecases/all_purchase.usecase.dart';
import 'package:popy_shop/features/purchases/domain/usecases/one_purchase.usecase.dart';

part '{{feat_name}}.state.dart';

class {{feat_name.pascalCase()}}Cubit extends Cubit<{{feat_name.pascalCase()}}State> {
  final All{{feat_name.pascalCase()}}Usecase all{{feat_name.pascalCase()}}Usecase;
  final One{{feat_name.pascalCase()}}Usecase one{{feat_name.pascalCase()}}Usecase;

  {{feat_name.pascalCase()}}Cubit({required this.all{{feat_name.pascalCase()}}Usecase, required this.one{{feat_name.pascalCase()}}Usecase})
    : super(const {{feat_name.pascalCase()}}Initial());

  Future<void> getAll() async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.getAll.name));

    final result = await all{{feat_name.pascalCase()}}Usecase.call(
      NoParams(),
    );

    result.fold(
      (l) => emit(
        {{feat_name.pascalCase()}}Error(operation: CrudOperation.getAll.name, message: l.message!),
      ),
      (r) => emit({{feat_name.pascalCase()}}GetAll(data: r)),
    );
  }

  Future<void> getOne(String id) async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.getOne.name));

    final result = await one{{feat_name.pascalCase()}}Usecase.call(id);

    result.fold(
      (l) => emit(
        {{feat_name.pascalCase()}}Error(operation: CrudOperation.getOne.name, message: l.message!),
      ),
      (r) => emit({{feat_name.pascalCase()}}GetOne(data: r)),
    );
  }
}

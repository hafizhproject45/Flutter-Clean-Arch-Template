import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/core/utils/constants.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}_request.entity.dart';

import 'package:{{project_name}}/features/{{feat_name}}s/domain/usecases/all_{{feat_name}}.usecase.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/usecases/one_{{feat_name}}.usecase.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/usecases/create_{{feat_name}}.usecase.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/usecases/update_{{feat_name}}.usecase.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/usecases/delete_{{feat_name}}.usecase.dart';

part '{{feat_name}}.state.dart';

class {{feat_name.pascalCase()}}Cubit extends Cubit<{{feat_name.pascalCase()}}State> {
  final All{{feat_name.pascalCase()}}Usecase allUsecase;
  final One{{feat_name.pascalCase()}}Usecase oneUsecase;
  final Create{{feat_name.pascalCase()}}Usecase createUsecase;
  final Update{{feat_name.pascalCase()}}Usecase updateUsecase;
  final Delete{{feat_name.pascalCase()}}Usecase deleteUsecase;

  {{feat_name.pascalCase()}}Cubit({
    required this.allUsecase,
    required this.oneUsecase,
    required this.createUsecase,
    required this.updateUsecase,
    required this.deleteUsecase,
  }) : super(const {{feat_name.pascalCase()}}Initial());

  Future<void> getAll() async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.getAll.name));

    final result = await allUsecase.call(NoParams());

    result.fold(
      (l) => emit({{feat_name.pascalCase()}}Error(operation: CrudOperation.getAll.name, message: l.message!)),
      (r) => emit({{feat_name.pascalCase()}}GetAll(data: r)),
    );
  }

  Future<void> getOne(String id) async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.getOne.name));

    final result = await oneUsecase.call(id);

    result.fold(
      (l) => emit({{feat_name.pascalCase()}}Error(operation: CrudOperation.getOne.name, message: l.message!)),
      (r) => emit({{feat_name.pascalCase()}}GetOne(data: r)),
    );
  }

  Future<void> create({{feat_name.pascalCase()}}RequestEntity entity) async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.create.name));

    final result = await createUsecase.call(entity);

    result.fold(
      (l) => emit({{feat_name.pascalCase()}}Error(operation: CrudOperation.create.name, message: l.message!)),
      (r) => emit({{feat_name.pascalCase()}}Created(message: "Data berhasil ditambahkan")),
    );
  }

  Future<void> update({{feat_name.pascalCase()}}RequestEntity entity) async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.update.name));

    final result = await updateUsecase.call(entity);

    result.fold(
      (l) => emit({{feat_name.pascalCase()}}Error(operation: CrudOperation.update.name, message: l.message!)),
      (r) => emit({{feat_name.pascalCase()}}Updated(message: "Data berhasil diperbarui")),
    );
  }

  Future<void> delete(String id) async {
    emit({{feat_name.pascalCase()}}Loading(operation: CrudOperation.delete.name));

    final result = await deleteUsecase.call(id);

    result.fold(
      (l) => emit({{feat_name.pascalCase()}}Error(operation: CrudOperation.delete.name, message: l.message!)),
      (r) => emit({{feat_name.pascalCase()}}Deleted(message: "Data berhasil dihapus")),
    );
  }
}

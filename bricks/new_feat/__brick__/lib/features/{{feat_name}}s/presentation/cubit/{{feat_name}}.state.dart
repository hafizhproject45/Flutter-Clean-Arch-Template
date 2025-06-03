// part of '{{feat_name}}.cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';

abstract class {{feat_name.pascalCase()}}State extends Equatable {
  final String? message;

  const {{feat_name.pascalCase()}}State([this.message]);

  @override
  List<Object?> get props => [message];
}

// INITIAL
final class {{feat_name.pascalCase()}}Initial extends {{feat_name.pascalCase()}}State {
  const {{feat_name.pascalCase()}}Initial() : super();
}

// LOADING
final class {{feat_name.pascalCase()}}Loading extends {{feat_name.pascalCase()}}State {
  final String? operation;

  const {{feat_name.pascalCase()}}Loading({this.operation}) : super();

  @override
  List<Object?> get props => [operation];
}

// GET ALL
final class {{feat_name.pascalCase()}}GetAll extends {{feat_name.pascalCase()}}State {
  final List<{{feat_name.pascalCase()}}Entity?> data;

  const {{feat_name.pascalCase()}}GetAll({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

// GET ONE
final class {{feat_name.pascalCase()}}GetOne extends {{feat_name.pascalCase()}}State {
  final {{feat_name.pascalCase()}}Entity? data;

  const {{feat_name.pascalCase()}}GetOne({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

// CREATED
final class {{feat_name.pascalCase()}}Created extends {{feat_name.pascalCase()}}State {
  const {{feat_name.pascalCase()}}Created({String? message}) : super(message);
}

// UPDATED
final class {{feat_name.pascalCase()}}Updated extends {{feat_name.pascalCase()}}State {
  const {{feat_name.pascalCase()}}Updated({String? message}) : super(message);
}

// DELETED
final class {{feat_name.pascalCase()}}Deleted extends {{feat_name.pascalCase()}}State {
  const {{feat_name.pascalCase()}}Deleted({String? message}) : super(message);
}

// ERROR
final class {{feat_name.pascalCase()}}Error extends {{feat_name.pascalCase()}}State {
  final String? operation;

  const {{feat_name.pascalCase()}}Error({this.operation, String? message}) : super(message);

  @override
  List<Object?> get props => [operation, message];
}

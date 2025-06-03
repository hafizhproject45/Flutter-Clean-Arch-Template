// ignore_for_file: overridden_fields

part of '{{feat_name}}.cubit.dart';

abstract class {{feat_name.pascalCase()}}State extends Equatable {
  final String? message;

  const {{feat_name.pascalCase()}}State(this.message);

  @override
  List<Object?> get props => [message];
}

final class {{feat_name.pascalCase()}}Initial extends {{feat_name.pascalCase()}}State {
  const {{feat_name.pascalCase()}}Initial() : super(null);
}

final class {{feat_name.pascalCase()}}Loading extends {{feat_name.pascalCase()}}State {
  final String? operation;
  const {{feat_name.pascalCase()}}Loading({this.operation}) : super(null);

  @override
  List<Object?> get props => [operation];
}

final class {{feat_name.pascalCase()}}GetAll extends {{feat_name.pascalCase()}}State {
  final List<{{feat_name.pascalCase()}}Entity?> data;

  const {{feat_name.pascalCase()}}GetAll({required this.data}) : super(null);

  @override
  List<Object?> get props => [data];
}

final class {{feat_name.pascalCase()}}GetOne extends {{feat_name.pascalCase()}}State {
  final {{feat_name.pascalCase()}}Entity? data;

  const {{feat_name.pascalCase()}}GetOne({required this.data}) : super(null);

  @override
  List<Object?> get props => [data];
}

final class {{feat_name.pascalCase()}}Error extends {{feat_name.pascalCase()}}State {
  final String? operation;

  @override
  final String? message;

  const {{feat_name.pascalCase()}}Error({this.operation, this.message}) : super(null);

  @override
  List<Object?> get props => [operation, message];
}

import 'package:equatable/equatable.dart';

class {{feat_name.pascalCase()}}RequestEntity extends Equatable {
  final String? id;

  const {{feat_name.pascalCase()}}RequestEntity({this.id});

  @override
  List<Object?> get props => [id];
}

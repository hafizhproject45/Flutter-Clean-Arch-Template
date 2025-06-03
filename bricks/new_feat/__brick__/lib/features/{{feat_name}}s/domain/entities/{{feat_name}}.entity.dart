import 'package:equatable/equatable.dart';

class {{feat_name.pascalCase()}}Entity extends Equatable {
  final String id;

  const {{feat_name.pascalCase()}}Entity({
    required this.id,
  });

  @override
  List<Object?> get props {
    return [id];
  }
}

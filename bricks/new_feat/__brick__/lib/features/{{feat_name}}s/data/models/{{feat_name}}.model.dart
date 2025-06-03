import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';


class {{feat_name.pascalCase()}}Model extends {{feat_name.pascalCase()}}Entity {
  const {{feat_name.pascalCase()}}Model({required super.id});

  factory {{feat_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feat_name.pascalCase()}}Model(id: json['id']);
  }
}

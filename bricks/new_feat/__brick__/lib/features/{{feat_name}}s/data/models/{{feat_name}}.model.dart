import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}.entity.dart';


class {{feat_name.pascalCase()}}Model extends {{feat_name.pascalCase()}}Entity {
  const {{feat_name.pascalCase()}}Model({super.id});

  factory {{feat_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feat_name.pascalCase()}}Model(id: json['id']);
  }

  {{feat_name.pascalCase()}}Entity toEntity() => {{feat_name.pascalCase()}}Entity(
    id: id,
  );
}

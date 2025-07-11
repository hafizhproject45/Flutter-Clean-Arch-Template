import 'package:{{project_name}}/features/{{feat_name}}s/domain/entities/{{feat_name}}_request.entity.dart';

class {{feat_name.pascalCase()}}RequestModel extends {{feat_name.pascalCase()}}RequestEntity {
  const {{feat_name.pascalCase()}}RequestModel({super.id});

  Map<String, dynamic> toJson() => {'id': id};

  factory {{feat_name.pascalCase()}}RequestModel.fromEntity({{feat_name.pascalCase()}}RequestEntity entity) => {{feat_name.pascalCase()}}RequestModel(
    id: entity.id,
  );

}

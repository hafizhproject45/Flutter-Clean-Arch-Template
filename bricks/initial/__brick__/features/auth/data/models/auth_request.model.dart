import 'package:{{project_name}}/features/auth/domain/entities/auth_request.entity.dart';

class AuthRequestModel extends AuthRequestEntity {
  const AuthRequestModel({required super.email, required super.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory AuthRequestModel.fromEntity(AuthRequestEntity entity) =>
      AuthRequestModel(email: entity.email, password: entity.password);
}

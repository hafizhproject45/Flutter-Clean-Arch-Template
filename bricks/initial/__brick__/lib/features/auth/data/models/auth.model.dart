// ignore_for_file: overridden_fields, annotate_overrides

import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';

part 'auth.model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends AuthEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String accessToken;
  @HiveField(2)
  final String refreshToken;
  @HiveField(3)
  final String role;

  const AuthModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  }) : super(
         id: id,
         accessToken: accessToken,
         refreshToken: refreshToken,
         role: role,
       );

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'],
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      role: map['role'],
    );
  }
}

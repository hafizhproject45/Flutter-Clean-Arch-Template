// ignore_for_file: overridden_fields, annotate_overrides

import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name}}/core/errors/exceptions.dart';
import 'package:{{project_name}}/core/utils/utility.dart';
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
    final mapUser = map['user'];

    if (mapUser == null) {
      throw AuthException(message: "User data is missing from response");
    }

    return AuthModel(
      id: mapUser['id'] as String,
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
      role: Utility.formatUserRole(mapUser['role']),
    );
  }
}

import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String accessToken;
  final String refreshToken;
  final String role;

  const AuthEntity({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  @override
  List<Object?> get props {
    return [id, accessToken, refreshToken, role];
  }
}

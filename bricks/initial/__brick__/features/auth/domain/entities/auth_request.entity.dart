import 'package:equatable/equatable.dart';

class AuthRequestEntity extends Equatable {
  final String email;
  final String password;

  const AuthRequestEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

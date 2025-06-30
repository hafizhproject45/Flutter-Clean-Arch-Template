// ignore_for_file: overridden_fields

part of 'auth.cubit.dart';

abstract class AuthState extends Equatable {
  final String? message;

  const AuthState([this.message]);

  @override
  List<Object?> get props => [message];
}

// INITIAL
class AuthInitial extends AuthState {
  final String tag = UniqueKey().toString();

  AuthInitial();

  @override
  List<Object?> get props => [tag];
}

// LOADING
final class AuthLoading extends AuthState {
  final String? operation;

  const AuthLoading({this.operation}) : super();

  @override
  List<Object?> get props => [operation];
}

// LOGIN
class AuthLoggedIn extends AuthState {
  final DateTime timestamp;

  AuthLoggedIn({DateTime? timestamp}) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [timestamp];
}

// LOGGED OUT
final class AuthLoggedOut extends AuthState {
  const AuthLoggedOut() : super(null);
}

class AuthGet extends AuthState {
  final AuthEntity data;

  const AuthGet({required this.data});

  @override
  List<Object?> get props => [data];
}

// ERROR
final class AuthError extends AuthState {
  final String? operation;

  const AuthError({this.operation, String? message}) : super(message);

  @override
  List<Object?> get props => [operation, message];
}

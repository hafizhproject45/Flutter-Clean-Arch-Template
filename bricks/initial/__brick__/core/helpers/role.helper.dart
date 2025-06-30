import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';

class RoleHelper {
  static AuthEntity? _user;

  static void setUser(AuthEntity user) {
    _user = user;
  }

  static AuthEntity? get user => _user;

  static String? get id => _user?.id;
  static String? get role => _user?.role;

  static bool isSuperAdmin() => role == 'Super Admin';
}

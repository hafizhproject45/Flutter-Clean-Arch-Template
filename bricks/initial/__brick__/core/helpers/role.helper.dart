import '../../domain/entities/auth/login.entity.dart';

class RoleHelper {
  static LoginEntity? _user;

  static void setUser(LoginEntity user) {
    _user = user;
  }

  static LoginEntity? get user => _user;

  static String? get role => _user?.role;

  static bool isSuperAdmin() => role == 'Super Admin';
  static bool isManagement() => role == 'Management';
  static bool isWorker() => role == 'Karyawan';
}

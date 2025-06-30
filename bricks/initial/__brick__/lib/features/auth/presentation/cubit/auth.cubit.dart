import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name}}/core/helpers/role.helper.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import 'package:{{project_name}}/core/utils/enums.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth.entity.dart';
import 'package:{{project_name}}/features/auth/domain/entities/auth_request.entity.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/check_login.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/get_login_data.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/login.usecase.dart';
import 'package:{{project_name}}/features/auth/domain/usecases/logout.usecase.dart';

part 'auth.state.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckLoginUsecase checkLoginUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final GetLoginDataUsecase loginDataUsecase;

  AuthCubit({
    required this.checkLoginUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.loginDataUsecase,
  }) : super(AuthInitial());

  Future<void> initializeAuth() async {
    emit(AuthInitial());

    final dataResult = await loginDataUsecase.call(NoParams());

    dataResult.fold((l) => null, (r) => RoleHelper.setUser(r));

    final loginResult = await checkLoginUsecase.call(NoParams());
    final check = loginResult.fold((l) => false, (r) => r == true);

    await Future.delayed(const Duration(seconds: 3));

    if (check == true) {
      emit(AuthLoggedIn());
    } else {
      emit(AuthLoggedOut());
    }
  }

  Future<void> getLoginData() async {
    emit(AuthLoading(operation: AuthOperation.checkLogin.name));

    final result = await loginDataUsecase.call(NoParams());

    result.fold(
      (l) => emit(
        AuthError(
          operation: AuthOperation.checkLogin.name,
          message: l.message ?? 'Gagal memuat data login',
        ),
      ),
      (r) {
        RoleHelper.setUser(r);
        emit(AuthGet(data: r));
      },
    );
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading(operation: AuthOperation.login.name));

    final loginData = AuthRequestEntity(email: email, password: password);

    final result = await loginUsecase.call(loginData);

    result.fold(
      (l) => emit(
        AuthError(
          operation: AuthOperation.login.name,
          message: l.message ?? 'Login gagal',
        ),
      ),
      (r) => emit(AuthLoggedIn()),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading(operation: AuthOperation.logout.name));

    final result = await logoutUsecase.call(NoParams());

    result.fold(
      (l) => emit(
        AuthError(
          operation: AuthOperation.logout.name,
          message: l.message ?? 'Logout gagal',
        ),
      ),
      (r) => emit(AuthLoggedOut()),
    );
  }
}

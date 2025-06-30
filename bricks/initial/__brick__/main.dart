import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:{{project_name}}/features/auth/presentation/cubit/auth.cubit.dart';

import 'core/utils/colors.dart';
import 'core/utils/route.dart';
import 'features/auth/presentation/pages/index.dart';
import 'injection_container.dart';
import 'presentation/pages/splash/index.dart';
import 'presentation/widgets/global/navbar.dart';
import 'services/initialize_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force orientation portrait
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await InitializeApp.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>()..initializeAuth(),
      child: ToastificationWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Popy's Management",
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColor.background,
            brightness: Brightness.light,
            primaryColor: AppColor.primary,
            colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColor.primary,
              secondary: AppColor.secondary,
            ),
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoggedIn || state is AuthGet) {
                return const MyNavigationBar();
              } else if (state is AuthInitial || state is AuthLoading) {
                return const SplashPage();
              } else {
                return const LoginPage();
              }
            },
          ),

          getPages: AppRoute.pageRoute,
        ),
      ),
    );
  }
}

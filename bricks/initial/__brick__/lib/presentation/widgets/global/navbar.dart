import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:{{project_name}}/features/auth/presentation/cubit/auth.cubit.dart';
import 'package:{{project_name}}/presentation/widgets/global/splash.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../core/utils/colors.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  static final PersistentTabController tabController =
      PersistentTabController();
  static final ValueNotifier<bool> isRefreshNotifier = ValueNotifier(false);

  static void navigateToTab(int index, {bool isRefresh = false}) {
    isRefreshNotifier.value = isRefresh;
    tabController.jumpToTab(index);
  }

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  bool _hasCalledGetData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasCalledGetData) {
      context.read<AuthCubit>().getLoginData();
      _hasCalledGetData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthGet) {
          final user = state.data;

          final bool isSuperAdmin = user.role == 'Super Admin';

          MyNavigationBar.tabController.jumpToTab(0);

          return _content(isSuperAdmin);
        } else if (state is AuthLoading) {
          return const SplashPage();
        } else {
          Get.toNamed('/login');
          return const SizedBox();
        }
      },
    );
  }

  PersistentTabView _content(bool isSuperAdmin) {
    return PersistentTabView(
      controller: MyNavigationBar.tabController,
      tabs: [
        PersistentTabConfig(
          screen: Container(),
          item: ItemConfig(
            activeForegroundColor: AppColor.primary,
            icon: const Icon(Bootstrap.house_door_fill),
            inactiveIcon: const Icon(
              Bootstrap.house_door,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            iconSize: 22,
            title: "Beranda",
          ),
        ),
      ],
      navBarBuilder:
          (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: const NavBarDecoration(
              color: AppColor.white,
              padding: EdgeInsets.symmetric(vertical: 7),
            ),
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:{{project_name}}/features/auth/presentation/cubit/auth.cubit.dart';

import '../../../core/utils/colors.dart';
import '../../../features/dashboards/presentation/pages/index.dart';
import '../../pages/master_data/index.dart';
import '../../pages/profile/index.dart';
import '../../pages/recap/index.dart';
import '../../pages/splash/index.dart';
import '../../pages/stock/index.dart';

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
          final bool isManagement = user.role == 'Management';
          final bool isWorker = user.role == 'Karyawan';

          MyNavigationBar.tabController.jumpToTab(0);

          return _content(isManagement, isWorker, isSuperAdmin);
        } else if (state is AuthLoading) {
          return const SplashPage();
        } else {
          Get.toNamed('/login');
          return const SizedBox();
        }
      },
    );
  }

  PersistentTabView _content(
    bool isManagement,
    bool isWorker,
    bool isSuperAdmin,
  ) {
    return PersistentTabView(
      controller: MyNavigationBar.tabController,
      tabs: [
        PersistentTabConfig(
          screen: const HomePage(),
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
        PersistentTabConfig(
          screen: const StockPage(),
          item: ItemConfig(
            activeForegroundColor: AppColor.primary,
            icon: const Icon(Bootstrap.box_fill),
            inactiveIcon: const Icon(
              Bootstrap.box,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            iconSize: 22,
            title: "Stok",
          ),
        ),
        PersistentTabConfig(
          screen: const RecapPage(),
          item: ItemConfig(
            activeForegroundColor: AppColor.primary,
            icon: const Icon(Bootstrap.clipboard_data_fill),
            inactiveIcon: const Icon(
              Bootstrap.clipboard_data,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            iconSize: 22,
            title: "Rekap",
          ),
        ),
        if (isManagement || isSuperAdmin)
          PersistentTabConfig(
            screen: const DataMasterPage(),
            item: ItemConfig(
              activeForegroundColor: AppColor.primary,
              icon: const Icon(Bootstrap.database_fill),
              inactiveIcon: const Icon(
                Bootstrap.database,
                color: Color.fromARGB(255, 206, 206, 206),
              ),
              iconSize: 22,
              title: "Master Data",
            ),
          ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            activeForegroundColor: AppColor.primary,
            icon: const Icon(Bootstrap.person_fill),
            inactiveIcon: const Icon(
              Bootstrap.person,
              color: Color.fromARGB(255, 206, 206, 206),
            ),
            iconSize: 22,
            title: "Profil",
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

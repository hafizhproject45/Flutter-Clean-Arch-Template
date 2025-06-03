import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_trans;
import 'package:{{project_name}}/presentation/pages/master_data/sku/add.dart';
import 'package:{{project_name}}/presentation/pages/master_data/sku/detail.dart';

import '../../presentation/pages/auth/login/index.dart';
import '../../presentation/pages/master_data/product/add.dart';
import '../../presentation/pages/master_data/product/detail.dart';
import '../../presentation/pages/master_data/supplier/add.dart';
import '../../presentation/pages/master_data/supplier/detail.dart';
import '../../presentation/pages/master_data/user/add.dart';
import '../../presentation/pages/master_data/user/detail.dart';
import '../../presentation/pages/profile/info/index.dart';
import '../../presentation/pages/profile/password/index.dart';
import '../../presentation/pages/recap/finance/detail.dart';
import '../../presentation/pages/sales/index.dart';
import '../../presentation/pages/sales/printer_select/index.dart';
import '../../presentation/pages/sales/product/detail.dart';
import '../../presentation/pages/sales/product/index.dart';
import '../../presentation/pages/stock/add.dart';
import '../../presentation/pages/stock/sku/index.dart';
import '../../presentation/widgets/global/navbar.dart';

class AppRoute {
  static List<GetPage> get pageRoute => [
    GetPage<LoginPage>(
      name: '/login',
      page: () => const LoginPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage<MyNavigationBar>(
      name: '/navbar',
      page: () => const MyNavigationBar(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //? SALES
    GetPage<SalesCashierPage>(
      name: '/sales',
      page: () => const SalesCashierPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<SalesProductPage>(
      name: '/sales-product',
      page: () => const SalesProductPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<SalesDetailPage>(
      name: '/sales-detail',
      page: () => const SalesDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<PrinterSelectPage>(
      name: '/print-discovery',
      page: () => const PrinterSelectPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //? STOCK
    GetPage<StockAddPage>(
      name: '/stock-add',
      page: () => const StockAddPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<StockSkuPage>(
      name: '/stock-sku',
      page: () => const StockSkuPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //? RECAP
    GetPage<RecapFinanceDetailPage>(
      name: '/recap-finance-detail',
      page: () => const RecapFinanceDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //? MASTER DATA
    GetPage<MasterUserAddPage>(
      name: '/master-user-add',
      page: () => const MasterUserAddPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterUserDetailPage>(
      name: '/master-user-detail',
      page: () => const MasterUserDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterSupplierAddPage>(
      name: '/master-supplier-add',
      page: () => const MasterSupplierAddPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterSupplierDetailPage>(
      name: '/master-supplier-detail',
      page: () => const MasterSupplierDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterProductAddPage>(
      name: '/master-product-add',
      page: () => const MasterProductAddPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterProductDetailPage>(
      name: '/master-product-detail',
      page: () => const MasterProductDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterSkuAddPage>(
      name: '/master-sku-add',
      page: () => const MasterSkuAddPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<MasterSKUDetailPage>(
      name: '/master-sku-detail',
      page: () => const MasterSKUDetailPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //? PROFILE
    GetPage<ProfileInfoPage>(
      name: '/profile-info',
      page: () => const ProfileInfoPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage<ProfilePasswordPage>(
      name: '/profile-password',
      page: () => const ProfilePasswordPage(),
      transition: get_trans.Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

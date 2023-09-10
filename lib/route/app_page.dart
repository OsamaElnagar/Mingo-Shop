import 'package:get/get.dart';
import 'package:mingo_shop/route/app_route.dart';

import '../view/dashboard/dashboard_bindings.dart';
import '../view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()
    ),
  ];
}
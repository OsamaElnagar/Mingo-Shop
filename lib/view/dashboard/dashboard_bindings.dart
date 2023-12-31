import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/category_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/product_controller.dart';

// import 'package:my_grocery/controller/auth_controller.dart';
// import 'package:my_grocery/controller/category_controller.dart';
// import 'package:my_grocery/controller/dashboard_controller.dart';
// import 'package:my_grocery/controller/home_controller.dart';
// import 'package:my_grocery/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut( () => ProductController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => AuthController());
  }
}

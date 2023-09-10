import 'package:get/get.dart';

class DashboardController extends GetxController {

  static DashboardController instance = Get.find();

  var tapIndex = 0;
  void updateIndex (int index) {
    tapIndex = index;
    update();
  }
}
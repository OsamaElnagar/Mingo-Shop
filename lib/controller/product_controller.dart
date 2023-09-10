import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mingo_shop/model/product.dart';
import 'package:mingo_shop/service/remote_service/remote_product.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductsLoading = false.obs;
  RxString searchVal =''.obs;
  TextEditingController searchTextEditController = TextEditingController();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductsLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      //debugPrint(productList.length.toString());
      isProductsLoading(false);
    }
  }

  void getProductsByName({required String keyword}) async {
    try {
      isProductsLoading(true);
      var result = await RemoteProductService().getByName(keyword:keyword);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      debugPrint(productList.length.toString());
      isProductsLoading(false);
    }
  }

  void getByCategory({required int id}) async {
    try {
      isProductsLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      debugPrint(productList.length.toString());
      isProductsLoading(false);
    }
  }
}

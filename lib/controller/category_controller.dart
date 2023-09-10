import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mingo_shop/service/local_service/local_category_service.dart';

import '../model/category.dart';
import '../service/remote_service/remote_category_service.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();

  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;
  final LocalCategoryService localCategoryService = LocalCategoryService();

  @override
  void onInit() async {
    await localCategoryService.init();
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    try {
      isCategoryLoading(true);

      if (localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(localCategoryService.getCategories());
      }

      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        localCategoryService.assignAllCategory(
            categories: categoryListFromJson(result.body)
        );
      }
    } finally {
      debugPrint(categoryList.length.toString());
      isCategoryLoading(false);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mingo_shop/model/product.dart';
import 'package:mingo_shop/service/local_service/local_ad_banner_service.dart';
import 'package:mingo_shop/service/local_service/local_category_service.dart';
import 'package:mingo_shop/service/local_service/local_product_service.dart';
import 'package:mingo_shop/service/remote_service/remote_banner_service.dart';
import 'package:mingo_shop/service/remote_service/remote_popular_category_service.dart';
import 'package:mingo_shop/service/remote_service/remote_popular_product_service.dart';
import '../model/ad_banner.dart';
import '../model/category.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  @override
  void onInit() async{
    await localAdBannerService.init();
    await localCategoryService.init();
    await localProductService.init();
    getAdBanners();
    getPopularCategories();
    getPopularProducts();

    super.onInit();
  }

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService localAdBannerService = LocalAdBannerService();
  final LocalCategoryService localCategoryService = LocalCategoryService();
  final LocalProductService localProductService = LocalProductService();

  Future<List<AdBanner>> getAdBanners() async {
    try {
      isBannerLoading(true);

      if (localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(localAdBannerService.getAdBanners());
      }

      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannersListFromJson(result.body));
        localAdBannerService.assignAllAdBanners(
            adBanners: adBannersListFromJson(result.body));
      }
    } finally {
      //debugPrint(bannerList.length.toString());
      isBannerLoading(false);
    }
    return bannerList;
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      if (localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList.assignAll(localCategoryService.getPopularCategories());
      }
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        localCategoryService.assignAllPopularCategory(
            categories: popularCategoryListFromJson(result.body));
      }
    } finally {
      //debugPrint(popularCategoryList.length.toString());
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async {
    try {
      isPopularProductLoading(true);
      if (localProductService.getProducts().isNotEmpty) {
        popularProductList.assignAll(localProductService.getProducts());
      }
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
        localProductService.assignAllProducts(
            products: popularProductListFromJson(result.body));
      }
    } finally {
      //debugPrint(popularProductList.length.toString());
      isPopularProductLoading(false);
    }
  }
}

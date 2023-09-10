import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mingo_shop/component/main_header.dart';
import 'package:mingo_shop/controller/controllers.dart';
import 'package:mingo_shop/controller/home_controller.dart';
import 'package:mingo_shop/view/home/compo/carousel_loading/carousel_view.dart';
import 'package:mingo_shop/view/home/compo/popular_category/popular_category.dart';
import 'package:mingo_shop/view/home/compo/popular_category/popular_category_card.dart';
import 'package:mingo_shop/view/home/compo/popular_category/popular_category_loading.dart';
import 'package:mingo_shop/view/home/compo/popular_product/popular_product.dart';
import 'package:mingo_shop/view/home/compo/popular_product/popular_product_loading.dart';
import 'package:mingo_shop/view/home/compo/section_title.dart';

import 'compo/carousel_loading/carouse_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Obx(() {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselView(
                            bannerList: homeController.bannerList);
                      } else {
                        return const CarouselLoading();
                      }
                    }),
                    const SectionTitle(title: "Popular Category"),
                    Obx(() {
                      if (homeController.popularCategoryList.isNotEmpty) {
                        return PopularCategory(
                            categories: homeController.popularCategoryList);
                      } else {
                        return const PopularCategoryLoading();
                      }
                    }),
                    const SectionTitle(title: "Popular Product"),
                    Obx(() {
                      if (homeController.popularProductList.isNotEmpty) {
                        return PopularProduct(
                            popularProducts: homeController.popularProductList);
                      } else {
                        return const PopularProductLoading();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),);
  }
}

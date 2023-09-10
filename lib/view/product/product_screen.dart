import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mingo_shop/component/main_header.dart';

import '../../controller/controllers.dart';
import 'compo/product_grid.dart';
import 'compo/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx(
              () {
                if (productController.isProductsLoading.value) {
                  return const ProductLoadingGrid();
                } else {
                  if (productController.productList.isNotEmpty) {
                    return ProductGrid(products: productController.productList);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/product_not_found.png'),
                        const SizedBox(height: 10),
                        const Text('Products Not Found!'),
                      ],
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

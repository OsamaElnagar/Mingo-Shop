import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/controllers.dart';
import 'compo/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.categoryList.isNotEmpty) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) => CategoryCard(
            category: categoryController.categoryList[index],
          ),
        );
      } else {
        return Center(
          child: Container(
            child: const Text('data'),
          ),
        );
      }
    });
  }
}

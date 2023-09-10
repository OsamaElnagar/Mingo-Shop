import 'package:flutter/material.dart';
import 'package:mingo_shop/view/home/compo/popular_category/popular_category_card.dart';

import '../../../../model/category.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => PopularCategoryCard(
          category: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }
}

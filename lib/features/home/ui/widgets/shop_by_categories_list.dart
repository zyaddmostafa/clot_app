import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/shop_by_categories_item.dart';
import 'package:flutter/material.dart';

class ShopByCategoriesList extends StatelessWidget {
  const ShopByCategoriesList({super.key, required this.categories});
  final List<CategoryItem> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ShopByCategoriesItem(
            categoryItem: categories[index],
            onTap: () {
              context.pushNamed(
                Routes.categoryProductsScreen,
                arguments: categories[index].name,
              );
            },
          ),
        );
      }),
    );
  }
}

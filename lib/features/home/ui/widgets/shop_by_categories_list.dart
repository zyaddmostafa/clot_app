import 'package:clot_app/features/home/ui/widgets/shop_by_categories_item.dart';
import 'package:flutter/material.dart';

class ShopByCategoriesList extends StatelessWidget {
  const ShopByCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ShopByCategoriesItem(),
        );
      }),
    );
  }
}

import 'dart:developer';

import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/categories_section_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSectionList extends StatelessWidget {
  const CategoriesSectionList({super.key, required this.categories});
  final List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13),
            child: CategoriesSectionListItem(
              categoryItem: categories[index],
              onTap: () {
                log('Category tapped: ${categories[index]}');
                context.pushNamed(
                  Routes.categoryProductsScreen,
                  arguments: categories[index].name,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

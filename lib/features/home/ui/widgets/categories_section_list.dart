import 'dart:developer';

import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/features/home/ui/widgets/categories_section_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSectionList extends StatelessWidget {
  const CategoriesSectionList({super.key});

  final List<String> categories = const [
    'Hoodies',
    'Accessories',
    'Shorts',
    'Shoes',
    'Bags',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13),
            child: CategoriesSectionListItem(
              categoryName: categories[index],
              onTap: () {
                log('Category tapped: ${categories[index]}');
                context.pushNamed(
                  Routes.categoryProductsScreen,
                  arguments: categories[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

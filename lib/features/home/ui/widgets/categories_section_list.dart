import 'package:clot_app/features/home/ui/widgets/categories_section_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSectionList extends StatelessWidget {
  const CategoriesSectionList({super.key});

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
              categoryName: 'Category $index',
              onTap: () {
                // Handle tap
              },
            ),
          );
        },
      ),
    );
  }
}

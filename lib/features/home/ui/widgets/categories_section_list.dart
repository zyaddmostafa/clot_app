import 'package:clot_app/features/home/ui/widgets/categories_section_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesSectionList extends StatelessWidget {
  const CategoriesSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return const CategoriesSectionListItem(
          imagePath: 'assets/images/test_image_2.png',
          categoryName: 'Category ',
        );
      }),
    );
  }
}

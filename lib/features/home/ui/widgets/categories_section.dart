import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:clot_app/features/home/ui/widgets/categories_section_list.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionsHeader(title: 'Categories'),
        verticalSpace(17),
        const CategoriesSectionList(),
      ],
    );
  }
}

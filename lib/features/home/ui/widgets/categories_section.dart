import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
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
        SectionsHeader(
          title: 'Categories',
          onTap: () => context.pushNamed(Routes.shopByCategoriesScreen),
        ),
        verticalSpace(17),
        const CategoriesSectionList(),
      ],
    );
  }
}

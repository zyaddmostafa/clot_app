import 'dart:developer';

import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:clot_app/features/home/ui/widgets/categories_section_list.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_category_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SizedBox(
          height: 90.h,
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen:
                (previous, current) =>
                    current is HomeCategorySuccess ||
                    current is HomeCategoryLoading ||
                    current is HomeCategoryError,
            builder: (context, state) {
              if (state is HomeCategoryLoading) {
                log('Building shimmer for category loading');
                return const ShimmerCategoryItemList();
              } else if (state is HomeCategorySuccess) {
                log('Building shimmer for category success');
                return CategoriesSectionList(categories: state.categories);
              } else if (state is HomeCategoryError) {
                log('Error fetching categories: ${state.errorMessage}');
                return Center(child: Text(state.errorMessage));
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}

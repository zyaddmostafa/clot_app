import 'dart:developer';

import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/widgets/product_list.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: 'New In',
          color: AppColors.primaryColor,
          onTap: () {
            context.pushNamed(Routes.seeAllProductsScreen, arguments: 'New In');
          },
        ),
        verticalSpace(17),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen:
              (previous, current) =>
                  current is HomeProductLoading ||
                  current is HomeProductSuccess ||
                  current is HomeProductError,
          builder: (context, state) {
            if (state is HomeProductLoading) {
              return const ShimmerProductList();
            } else if (state is HomeProductSuccess) {
              final reversedProducts = state.products.reversed.toList();
              return ProductList(products: reversedProducts);
            } else if (state is HomeProductError) {
              log('Error fetching products: ${state.errorMessage}');
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}

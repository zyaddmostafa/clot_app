import 'dart:developer';

import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/widgets/product_list.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsHeader(
          title: 'Top Selling',
          onTap: () {
            context.pushNamed(
              Routes.seeAllProductsScreen,
              arguments: 'Top Selling',
            );
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
              log(state.products.toString());
              return ProductList(products: state.products);
            } else if (state is HomeProductError) {
              log('Error fetching products: ${state.errorMessage}');
              return Center(child: Text(state.errorMessage));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

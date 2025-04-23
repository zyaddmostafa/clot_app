import 'dart:developer';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/widgets/category_product_grid_view.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_category_product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              const PopButton(),
              verticalSpace(16),

              // here create for me a grid builder with 2 columns and 2 items in each column
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        current is HomeFilterProductLoading ||
                        current is HomeFilterProductSuccess ||
                        current is HomeFilterProductError,
                builder: (context, state) {
                  if (state is HomeFilterProductLoading) {
                    return const ShimmerCategoryProductGridView(
                      itemCount: 4,
                      categoryName: 'Loading...',
                    );
                  } else if (state is HomeFilterProductSuccess) {
                    return CategoryProductGridViewSection(
                      products: state.products,
                      categoryName: categoryName,
                    );
                  } else if (state is HomeFilterProductError) {
                    log('Error fetching products: ${state.errorMessage}');
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

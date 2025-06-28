import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit/home_cubit.dart';
import 'package:clot_app/core/widgets/custom_product_grid_view.dart';
import 'package:clot_app/core/widgets/shimmer_category_product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllProductsScreen extends StatelessWidget {
  const SeeAllProductsScreen({super.key, required this.categoryName});
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
              Text('$categoryName Product', style: AppTextStyles.font16Bold),
              verticalSpace(16),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeProductLoading) {
                    return const ShimmerProductGridView(itemCount: 6);
                  } else if (state is HomeProductSuccess) {
                    return Expanded(
                      child: CustomProductGridView(products: state.products),
                    );
                  } else if (state is HomeProductError) {
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

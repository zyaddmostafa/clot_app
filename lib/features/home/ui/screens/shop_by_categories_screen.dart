import 'dart:developer';

import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_shop_by_category_item.dart';
import 'package:clot_app/features/home/ui/widgets/shop_by_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopByCategoriesScreen extends StatelessWidget {
  const ShopByCategoriesScreen({super.key});

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
              const Text('Shop by Categories', style: AppTextStyles.font24Bold,),
              verticalSpace(14),

              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        current is HomeCategoryLoading ||
                        current is HomeCategorySuccess ||
                        current is HomeCategoryError,
                builder: (context, state) {
                  if (state is HomeCategoryLoading) {
                    log('Building shimmer for category loading');
                    return const ShimmerShopByCategoriesList();
                  } else if (state is HomeCategorySuccess) {
                    log('Building shimmer for category success');
                    return ShopByCategoriesList(categories: state.categories);
                  } else if (state is HomeCategoryError) {
                    log('Error fetching categories: ${state.errorMessage}');
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

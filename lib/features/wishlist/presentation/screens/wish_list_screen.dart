import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/custom_product_grid_view.dart';
import 'package:clot_app/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListScreen extends StatelessWidget {
  final bool popButtonVisible;
  const WishListScreen({super.key, this.popButtonVisible = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              popButtonVisible
                  ? Row(
                    spacing: 90.w,
                    children: const [
                      PopButton(),

                      // Placeholder for spacing
                      Text('My Wishlist', style: AppTextStyles.font16Bold),
                    ],
                  )
                  : const Center(
                    child: Text('My Wishlist', style: AppTextStyles.font16Bold),
                  ),

              verticalSpace(32),
              BlocBuilder<WishListCubit, WishListState>(
                // Same as before
                buildWhen:
                    (previous, current) =>
                        current is WishListLoad || current is WishListEmpty,
                builder: (context, state) {
                  if (state is WishListLoad) {
                    return _wishlistLoadedState(state.wishList);
                  } else if (state is WishListEmpty) {
                    {
                      return _wishlistEmptyState(message: state.message);
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wishlistLoadedState(List<ProductModel> products) {
    return CustomProductGridView(products: products);
  }

  Widget _wishlistEmptyState({required String message}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.assetsImagesBag, height: 200.h, width: 200.w),
          verticalSpace(20),
          const Text('Your wishlist is empty', style: AppTextStyles.font24Bold),
          verticalSpace(10),
          const Text(
            'Add items to your wishlist to view them here.',
            textAlign: TextAlign.center,
            style: AppTextStyles.font16Regular,
          ),
        ],
      ),
    );
  }
}

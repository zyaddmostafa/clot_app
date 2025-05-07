import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/cubits/product_quantity_cubit/cubit/cubit/product_details_cubit.dart';
import 'package:clot_app/features/product_details/presentation/widgets/add_to_bag.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_details_header.dart';
import 'package:clot_app/features/product_details/presentation/widgets/select_quantity.dart';
import 'package:clot_app/features/product_details/presentation/widgets/select_size_and_select_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

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
              ProductDetailsHeader(productModel: productModel),
              verticalSpace(24),
              CachedNetworkImage(
                height: 350.h,
                width: double.infinity,
                imageUrl: productModel.image!,
                imageBuilder:
                    (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
              ),
              verticalSpace(16),
              Text(
                productModel.title ?? 'No Title',
                style: AppTextStyles.font16Bold,
              ),
              verticalSpace(12),
              Text(
                "\$${productModel.price!}",
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              verticalSpace(14),
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen:
                    (previous, current) =>
                        current is ProductDetailsSelectedSize,
                builder: (context, state) {
                  return SelectSizeAndSelectColor(
                    title: 'Size',
                    sizeModel: productModel.sizeList,
                    size:
                        productModel.sizeList!.sizes[context
                            .read<ProductDetailsCubit>()
                            .selectedSizeIndex],
                  );
                },
              ),
              verticalSpace(12),
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen:
                    (previous, current) =>
                        current is ProductDetailsSelectedColor,
                builder: (context, state) {
                  return SelectSizeAndSelectColor(
                    title: 'Color',
                    color: Color(
                      int.parse(
                        productModel
                            .colorList!
                            .colors[context
                                .read<ProductDetailsCubit>()
                                .selectedColorIndex]
                            .hex,
                      ),
                    ),
                    colorList: productModel.colorList,
                  );
                },
              ),
              verticalSpace(12),
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen:
                    (previous, current) => current is ProductDetailsQuantaty,
                builder: (context, state) {
                  return SelectQuantity(
                    title: 'Quantity',
                    onIncrement: () {
                      context.read<ProductDetailsCubit>().increment();
                    },
                    onDecrement: () {
                      context.read<ProductDetailsCubit>().decrement();
                    },
                    quantityNumber:
                        context.read<ProductDetailsCubit>().quantity,
                  );
                },
              ),
              const Spacer(),

              BlocListener<CartCubit, CartState>(
                listenWhen:
                    (previous, current) =>
                        current is AddToCartError ||
                        current is AddToCartSuccess ||
                        current is AddToCartloading,

                listener: (context, state) {
                  if (state is AddToCartloading) {
                  } else if (state is AddToCartSuccess) {
                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart successfully!'),
                      ),
                    );
                  } else if (state is AddToCartError) {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'failed to add to cart: ${state.errorMessage}',
                        ),
                      ),
                    );
                  }
                },
                child: AddToBag(productModel: productModel),
              ),

              verticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}

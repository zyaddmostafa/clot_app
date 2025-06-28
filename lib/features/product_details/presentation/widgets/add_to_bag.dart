import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/features/cart/data/model/cart_product_request_model.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/cubits/product_quantity_cubit/cubit/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CartCubit>().state is AddToCartloading;
    return GestureDetector(
      onTap: () {
        isLoading
            ? null
            : context.read<CartCubit>().addToCart(
              CartProductRequestModel(
                productid: productModel.productId!,
                productTitle: productModel.title ?? 'No Title',
                color:
                    productModel
                        .colorList!
                        .colors[context
                            .read<ProductDetailsCubit>()
                            .selectedColorIndex]
                        .name,
                size:
                    productModel.sizeList!.sizes[context
                        .read<ProductDetailsCubit>()
                        .selectedSizeIndex],
                quantity: context.read<ProductDetailsCubit>().quantity,
                mainPrice: productModel.price!,
                totalPrice:
                    (double.parse(productModel.price ?? '0') *
                            context.read<ProductDetailsCubit>().quantity)
                        .toString(),
                imageUrl: productModel.image!,
                createdDate: DateTime.now(),
              ),
            );
      },
      child: Container(
        height: 52.h,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: ShapeDecoration(
          color: AppColors.primaryColor /* Primary-100 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen:
                    (previous, current) => current is ProductDetailsQuantaty,
                builder: (context, state) {
                  final priceAsNum =
                      double.tryParse(productModel.price ?? '0') ?? 0;
                  // Multiply by quantity
                  final productPrice =
                      priceAsNum * context.read<ProductDetailsCubit>().quantity;
                  return Text(
                    '\$$productPrice',
                    style: AppTextStyles.font16Bold,
                  );
                },
              ),
              if (isLoading)
                const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),

              const Text('Add to Bag', style: AppTextStyles.font16Regular),
            ],
          ),
        ),
      ),
    );
  }
}

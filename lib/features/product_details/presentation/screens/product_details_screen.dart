import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/cubits/product_quantity_cubit/cubit/product_quantity_cubit.dart';
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
              const ProductDetailsHeader(),
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
                          fit: BoxFit.cover,
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
              SelectSizeAndSelectColor(
                title: 'Size',
                sizeModel: productModel.sizeList,
              ),
              verticalSpace(12),
              SelectSizeAndSelectColor(
                title: 'Color',
                color: Color(int.parse(productModel.colorList!.colors[0].hex)),
                colorList: productModel.colorList,
              ),
              verticalSpace(12),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return SelectQuantity(
                    title: 'Quantity',
                    onIncrement: () {
                      context.read<ProductQuantityCubit>().increment();
                    },
                    onDecrement: () {
                      context.read<ProductQuantityCubit>().decrement();
                    },
                    quantityNumber: state,
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  // Get the price from the product model and convert it to a number
                  final priceAsNum =
                      double.tryParse(productModel.price ?? '0') ?? 0;
                  // Multiply by quantity
                  final productPrice = priceAsNum * state;
                  return AddToBag(productPrice: productPrice.toString());
                },
              ),
              verticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    required this.cartProductModel,
    this.onRemove,
  });
  final CartProductResponseModel cartProductModel;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          CachedNetworkImage(
            imageUrl: cartProductModel.imageUrl,
            width: 64.w,
            height: 80.h,
            imageBuilder:
                (context, imageProvider) => Container(
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
            placeholder:
                (context, url) => Container(
                  width: 64.w,
                  height: 80.h,
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
            errorWidget:
                (context, url, error) => Container(
                  width: 64.w,
                  height: 80.h,
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Icon(Icons.error_outline, color: Colors.grey.shade600),
                ),
          ),
          horizontalSpace(12),

          // Product Details (Expanded to push price to end)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Name
                Text(
                  cartProductModel.productTitle,
                  style: AppTextStyles.font14Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(26),

                // Quantity selector (optional)
                // Row(
                //   children: [
                //     _buildQuantityButton(
                //       icon: Icons.remove,
                //       onTap: () {
                //         // Handle quantity decrease
                //       },
                //     ),
                //     const Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8),
                //       child: Text('1', style: AppTextStyles.font14Regular),
                //     ),
                //     _buildQuantityButton(
                //       icon: Icons.add,
                //       onTap: () {
                //         // Handle quantity increase
                //       },
                //     ),
                //   ],
                // ),
                // verticalSpace(12),

                // Size and Color
                Row(
                  children: [
                    const Text('Size:', style: AppTextStyles.font12Regular),
                    horizontalSpace(4),
                    Text(
                      cartProductModel.size,
                      style: AppTextStyles.font12Bold,
                    ),
                    horizontalSpace(16),
                    const Text('Color:', style: AppTextStyles.font12Regular),
                    horizontalSpace(4),
                    Text(
                      cartProductModel.color,
                      style: AppTextStyles.font12Bold,
                    ),
                    horizontalSpace(16),
                    const Text('Qty:', style: AppTextStyles.font12Regular),
                    horizontalSpace(4),
                    Text(
                      cartProductModel.quantity.toString(),
                      style: AppTextStyles.font12Bold,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Price and Remove Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${cartProductModel.mainPrice}',
                style: AppTextStyles.font14Bold,
              ),
              verticalSpace(24),
              GestureDetector(
                onTap: onRemove,
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: CupertinoColors.destructiveRed,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildQuantityButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(child: Icon(icon, size: 16, color: Colors.grey.shade600)),
    ),
  );
}

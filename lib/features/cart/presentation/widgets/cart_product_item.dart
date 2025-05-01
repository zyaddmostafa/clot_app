import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key});

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
          Container(
            width: 64.w,
            height: 80.h,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPvTXxXCmeP792_iLfwMlDR-0UsSGQHvfX8Q&s",
                ),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
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
                const Text(
                  'Product Name',
                  style: AppTextStyles.font14Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(12),

                // Quantity selector (optional)
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        // Handle quantity decrease
                      },
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('1', style: AppTextStyles.font14Regular),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () {
                        // Handle quantity increase
                      },
                    ),
                  ],
                ),
                verticalSpace(12),

                // Size and Color
                Row(
                  children: [
                    const Text('Size:', style: AppTextStyles.font12Regular),
                    horizontalSpace(4),
                    const Text('M', style: AppTextStyles.font12Bold),
                    horizontalSpace(16),
                    const Text('Color:', style: AppTextStyles.font12Regular),
                    horizontalSpace(4),
                    const Text('Black', style: AppTextStyles.font12Bold),
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
              const Text('\$100', style: AppTextStyles.font14Bold),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // Handle remove action
                },
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

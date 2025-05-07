import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCartProductListView extends StatelessWidget {
  const ShimmerCartProductListView({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder:
            (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: ShimmerCartProductItem(),
            ),
      ),
    );
  }
}

class ShimmerCartProductItem extends StatelessWidget {
  const ShimmerCartProductItem({super.key});

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
          // Shimmer for product image
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 78, 78, 78),
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 64.w,
              height: 80.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          horizontalSpace(12),

          // Shimmer for product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product name shimmer
                Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 78, 78, 78),
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 120.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                verticalSpace(26),

                // Size, color, quantity shimmer
                Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 78, 78, 78),
                  highlightColor: Colors.grey[100]!,
                  child: Row(
                    children: [
                      Container(width: 30.w, height: 12.h, color: Colors.white),
                      horizontalSpace(4),
                      Container(width: 20.w, height: 12.h, color: Colors.white),
                      horizontalSpace(16),
                      Container(width: 30.w, height: 12.h, color: Colors.white),
                      horizontalSpace(4),
                      Container(width: 20.w, height: 12.h, color: Colors.white),
                      horizontalSpace(16),
                      Container(width: 20.w, height: 12.h, color: Colors.white),
                      horizontalSpace(4),
                      Container(width: 10.w, height: 12.h, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Shimmer for price and delete button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 78, 78, 78),
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 50.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              verticalSpace(24),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 78, 78, 78),
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

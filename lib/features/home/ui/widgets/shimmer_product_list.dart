import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductList extends StatelessWidget {
  const ShimmerProductList({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 282.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 78, 78, 78),
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 165.w,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image placeholder
                  Container(
                    height: 200.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Product title placeholder
                  Container(
                    height: 16.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Product price placeholder
                  Container(
                    height: 16.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

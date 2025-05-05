import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryItemList extends StatelessWidget {
  const ShimmerCategoryItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h, // Adjust the height based on your category item height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 78, 78, 78),
                    highlightColor: Colors.grey[100]!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 56.h,
                        width: 56.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 78, 78, 78),
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 40.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductItem extends StatelessWidget {
  const ShimmerProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 270.h,
      margin: const EdgeInsets.only(bottom: 16),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 78, 78, 78),
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(
              alpha: 0.9,
            ), // Key change - semi-transparent
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Image placeholder
              Container(
                width: double.infinity,
                height: 220.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),

              // Favorite button placeholder
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Bottom text section
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.w,
                        height: 14.h,
                        color: Colors.white,
                      ),
                      verticalSpace(8),
                      Container(width: 60.w, height: 14.h, color: Colors.white),
                    ],
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

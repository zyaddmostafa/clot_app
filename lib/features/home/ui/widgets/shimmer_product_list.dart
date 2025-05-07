import 'package:clot_app/features/home/ui/widgets/shimmer_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          return const Padding(
            padding: EdgeInsets.only(right: 12),
            child: ShimmerProductItem(),
          );
        },
      ),
    );
  }
}

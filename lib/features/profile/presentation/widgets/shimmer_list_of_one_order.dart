import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:clot_app/core/utils/spacing.dart';

class ShimmerListOfOneOrder extends StatelessWidget {
  const ShimmerListOfOneOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor:
            Theme.of(context).brightness == Brightness.light
                ? Colors.grey[500]!
                : const Color.fromARGB(255, 78, 78, 78),
        highlightColor:
            Theme.of(context).brightness == Brightness.light
                ? Colors.grey[800]!
                : Colors.grey[100]!,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder:
              (_, __) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: OrderItemShimmer(),
              ),
        ),
      ),
    );
  }
}

class OrderItemShimmer extends StatelessWidget {
  const OrderItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(
          context,
        ).cardColor.withValues(alpha: 0.4), // Background color for shimmer
        // Remove the background color to let shimmer show through
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          _buildShimmerRow(
            children: [
              _buildShimmerBox(width: 80, height: 16),
              _buildShimmerBox(width: 70, height: 14),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          verticalSpace(12),

          // Divider
          _buildShimmerBox(height: 1, width: double.infinity),
          verticalSpace(12),

          // Product row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              _buildShimmerBox(width: 60, height: 60),
              horizontalSpace(12),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerBox(width: double.infinity, height: 16),
                    verticalSpace(8),
                    _buildShimmerRow(
                      children: [
                        _buildShimmerBox(width: 40, height: 12),
                        _buildShimmerBox(width: 40, height: 12),
                      ],
                      spacing: 8,
                    ),
                    verticalSpace(8),
                    _buildShimmerBox(width: 60, height: 12),
                  ],
                ),
              ),

              // Price
              _buildShimmerBox(width: 50, height: 16),
            ],
          ),
          verticalSpace(12),

          // Footer
          _buildShimmerRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerBox(width: 80, height: 12),
                  verticalSpace(4),
                  _buildShimmerBox(width: 120, height: 12),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildShimmerBox(width: 60, height: 12),
                  verticalSpace(4),
                  _buildShimmerBox(width: 80, height: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerBox({
    double? width,
    double? height,
    double borderRadius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget _buildShimmerRow({
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    double spacing = 0,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:
          children
              .map(
                (child) => Padding(
                  padding: EdgeInsets.only(right: spacing),
                  child: child,
                ),
              )
              .toList(),
    );
  }
}

import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.subtotal});
  final double subtotal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSummaryRow('Subtotal', '\$$subtotal'),
          _buildSummaryRow('Shipping Cost', '\$20.00'),
          _buildSummaryRow('Tax', '\$0.00'),
          const Divider(height: 24),
          _buildSummaryRow('Total', '\$$subtotal ', isTotal: true),
        ],
      ),
    );
  }
}

Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              isTotal ? AppTextStyles.font16Bold : AppTextStyles.font16Regular,
        ),
        Text(
          value,
          style:
              isTotal ? AppTextStyles.font16Bold : AppTextStyles.font16Regular,
        ),
      ],
    ),
  );
}

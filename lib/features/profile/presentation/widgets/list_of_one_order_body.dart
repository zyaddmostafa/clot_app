import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/checkout/data/models/checkout_response_model.dart';
import 'package:clot_app/features/profile/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';

class ListOfOneOrderBody extends StatelessWidget {
  const ListOfOneOrderBody({
    super.key,
    required this.orderDate,
    required this.orderSubTotal,
    required this.orderModel,
    required this.oneOrderProductsCount,
    required this.orderAddress,
    required this.orderStatus,
  });
  final String orderStatus;
  final String orderDate;
  final String orderSubTotal;
  final OrderModel orderModel;
  final int oneOrderProductsCount;
  final String orderAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildOrderHeader(
          orderDate: orderDate,
          subtotal: orderSubTotal,
          orderStatus: orderStatus,
        ),
        verticalSpace(4),
        const Divider(thickness: 2),
        verticalSpace(4),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Column(
              children: [
                OrderItem(orderModel: orderModel),
                if (index != oneOrderProductsCount - 1) verticalSpace(16),
              ],
            );
          },
          itemCount: oneOrderProductsCount,
        ),
        verticalSpace(16),
        _buildDeliveryAddress(orderAddress),
      ],
    );
  }
}

Widget _buildOrderHeader({
  required String orderDate,
  required String subtotal,
  required String orderStatus,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        orderStatus,
        style: AppTextStyles.font14Bold.copyWith(color: AppColors.primaryColor),
      ),
      Text(orderDate, style: AppTextStyles.font14Bold),
      Text('Subtotal: \$$subtotal', style: AppTextStyles.font14Bold),
    ],
  );
}

Widget _buildDeliveryAddress(String orderAddress) {
  return Row(
    children: [
      const Text('Address:', style: AppTextStyles.font12Regular),
      horizontalSpace(4),
      Text(orderAddress, style: AppTextStyles.font12Bold),
    ],
  );
}

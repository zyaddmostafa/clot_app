import 'package:clot_app/features/checkout/data/models/checkout_response_model.dart';
import 'package:clot_app/features/profile/presentation/widgets/list_of_one_order_body.dart';
import 'package:flutter/material.dart';

class ListOfOneOrder extends StatelessWidget {
  const ListOfOneOrder({
    super.key,
    required this.orderModel,
    required this.orderDate,
    required this.orderAddress,
    required this.orderSubTotal,
    required this.oneOrderProductsCount,
  });

  final int oneOrderProductsCount;
  final OrderModel orderModel;
  final String orderDate, orderAddress, orderSubTotal;
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
      child: ListOfOneOrderBody(
        orderDate: orderDate,
        orderSubTotal: orderSubTotal,
        orderModel: orderModel,
        oneOrderProductsCount: oneOrderProductsCount,
        orderAddress: orderAddress,
      ),
    );
  }
}

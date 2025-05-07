import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/checkout/data/models/checkout_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildProductRow(orderModel)],
    );
  }

  Widget _buildProductRow(OrderModel orderModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(imageUrl: orderModel.imageUrl),
        horizontalSpace(12),
        _buildProductDetails(orderModel),
        _buildProductPrice(orderModel.totalPrice),
      ],
    );
  }

  Widget _buildProductImage({required String imageUrl}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 64.w,
      height: 80.h,
      imageBuilder:
          (context, imageProvider) => _buildImageContainer(imageProvider),
      placeholder: (context, url) => _buildPlaceholderContainer(context),
      errorWidget: (context, url, error) => _buildErrorContainer(),
    );
  }

  Widget _buildImageContainer(ImageProvider imageProvider) {
    return Container(
      decoration: ShapeDecoration(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  Widget _buildPlaceholderContainer(BuildContext context) {
    return Container(
      width: 64.w,
      height: 80.h,
      decoration: ShapeDecoration(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Center(
        child: SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContainer() {
    return Container(
      width: 64.w,
      height: 80.h,
      decoration: ShapeDecoration(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Icon(Icons.error_outline, color: Colors.grey.shade600),
    );
  }

  Widget _buildProductDetails(OrderModel orderModel) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductName(name: orderModel.productTitle),
          verticalSpace(26),
          _buildProductAttributes(orderModel),
        ],
      ),
    );
  }

  Widget _buildProductName({required String name}) {
    return Text(
      name,
      style: AppTextStyles.font14Bold,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductAttributes(OrderModel orderModel) {
    return Row(
      children: [
        _buildAttribute('Size:', orderModel.size),
        horizontalSpace(16),
        _buildAttribute('Color:', orderModel.color),
        horizontalSpace(16),
        _buildAttribute('Qty:', orderModel.quantity.toString()),
      ],
    );
  }

  Widget _buildAttribute(String label, String value) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.font12Regular),
        horizontalSpace(4),
        Text(value, style: AppTextStyles.font12Bold),
      ],
    );
  }

  Widget _buildProductPrice(String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('\$$price', style: AppTextStyles.font12Regular),
        verticalSpace(24),
      ],
    );
  }
}

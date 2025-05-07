import 'package:json_annotation/json_annotation.dart';
part 'checkout_response_model.g.dart';

@JsonSerializable()
class CheckoutResponseModel {
  final List<OrderModel> orderItems;
  final String address;
  final String paymentMethod;
  final String createdDate;
  final double subTotalPrice;
  final String orderStatus;

  CheckoutResponseModel({
    required this.orderItems,
    required this.address,
    required this.paymentMethod,
    required this.createdDate,
    required this.subTotalPrice,
    required this.orderStatus,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseModelFromJson(json);
}

@JsonSerializable()
class OrderModel {
  final String productId;
  final String productTitle;
  final String color;
  final String size;
  final String mainPrice;
  final String imageUrl;
  final int quantity;
  final String totalPrice;

  OrderModel({
    required this.productId,
    required this.productTitle,
    required this.color,
    required this.size,
    required this.mainPrice,
    required this.imageUrl,
    required this.quantity,
    required this.totalPrice,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

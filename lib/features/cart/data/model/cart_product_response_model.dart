import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_response_model.g.dart';

@JsonSerializable()
class CartProductResponseModel {
  final String productId;
  final String productTitle;
  final String color;
  final String size;
  final String mainPrice;
  final String imageUrl;
  final int quantity;
  final String totalPrice;

  CartProductResponseModel({
    required this.productId,
    required this.productTitle,
    required this.color,
    required this.size,
    required this.mainPrice,
    required this.imageUrl,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartProductResponseModel.fromJson(
    Map<String, dynamic> json,
    String id,
  ) => _$CartProductResponseModelFromJson(json, id);
}

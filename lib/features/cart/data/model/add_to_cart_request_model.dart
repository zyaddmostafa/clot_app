import 'package:json_annotation/json_annotation.dart';
part 'add_to_cart_model.g.dart';

@JsonSerializable()
class AddToCartRequestModel {
  final String productid;
  final String productTitle;
  final String color;
  final String size;
  final int quantity;
  final String mainPrice;
  final String totalPrice;
  final String imageUrl;
  final DateTime createdDate;

  AddToCartRequestModel({
    required this.productid,
    required this.productTitle,
    required this.color,
    required this.size,
    required this.quantity,
    required this.mainPrice,
    required this.totalPrice,
    required this.imageUrl,
    required this.createdDate,
  });
  // factory AddToBagModel.fromJson(Map<String, dynamic> json) =>
  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);

  // For updating cart items (e.g., changing quantity)
  AddToCartRequestModel copyWith({
    String? id,
    String? productid,
    String? productTitle,
    String? color,
    String? size,
    int? quantity,
    String? mainPrice,
    String? totalPrice,
    String? imageUrl,
    String? userId,
    DateTime? addedAt,
  }) {
    return AddToCartRequestModel(
      productid: productid ?? this.productid,
      productTitle: productTitle ?? this.productTitle,
      color: color ?? this.color,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      mainPrice: mainPrice ?? this.mainPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      createdDate: createdDate,
    );
  }
}

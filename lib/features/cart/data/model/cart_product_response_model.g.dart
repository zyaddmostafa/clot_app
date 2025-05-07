// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductResponseModel _$CartProductResponseModelFromJson(
  Map<String, dynamic> json,
  String id,
) => CartProductResponseModel(
  productId: id,
  productTitle: json['productTitle'] as String,
  color: json['color'] as String,
  size: json['size'] as String,
  mainPrice: json['mainPrice'] as String,
  imageUrl: json['imageUrl'] as String,
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: json['totalPrice'] as String,
);

Map<String, dynamic> _$CartProductResponseModelToJson(
  CartProductResponseModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'productTitle': instance.productTitle,
  'color': instance.color,
  'size': instance.size,
  'mainPrice': instance.mainPrice,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'totalPrice': instance.totalPrice,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestModel _$AddToCartRequestModelFromJson(
  Map<String, dynamic> json,
) => AddToCartRequestModel(
  productid: json['productid'] as String,
  productTitle: json['productTitle'] as String,
  color: json['color'] as String,
  size: json['size'] as String,
  quantity: (json['quantity'] as num).toInt(),
  mainPrice: json['mainPrice'] as String,
  totalPrice: json['totalPrice'] as String,
  imageUrl: json['imageUrl'] as String,
  createdDate: DateTime.parse(json['createdDate'] as String),
);

Map<String, dynamic> _$AddToCartRequestModelToJson(
  AddToCartRequestModel instance,
) => <String, dynamic>{
  'productid': instance.productid,
  'productTitle': instance.productTitle,
  'color': instance.color,
  'size': instance.size,
  'quantity': instance.quantity,
  'mainPrice': instance.mainPrice,
  'totalPrice': instance.totalPrice,
  'imageUrl': instance.imageUrl,
  'createdDate': instance.createdDate.toIso8601String(),
};

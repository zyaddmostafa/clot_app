// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequestModel _$CheckoutRequestModelFromJson(
  Map<String, dynamic> json,
) => CheckoutRequestModel(
  cartItems: CheckoutRequestModel._cartItemsFromJson(json['cartItems'] as List),
  address: json['address'] as String,
  paymentMethod: json['paymentMethod'] as String,
  createdDate: json['createdDate'] as String,
  subTotalPrice: (json['subTotalPrice'] as num).toDouble(),
);

Map<String, dynamic> _$CheckoutRequestModelToJson(
  CheckoutRequestModel instance,
) => <String, dynamic>{
  'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
  'address': instance.address,
  'paymentMethod': instance.paymentMethod,
  'createdDate': instance.createdDate,
  'subTotalPrice': instance.subTotalPrice,
};

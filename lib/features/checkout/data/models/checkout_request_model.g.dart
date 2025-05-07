// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequestModel _$CheckoutRequestModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutRequestModel(
      orderItems:
          CheckoutRequestModel._cartItemsFromJson(json['orderItems'] as List),
      address: json['address'] as String,
      paymentMethod: json['paymentMethod'] as String,
      createdDate: json['createdDate'] as String,
      subTotalPrice: (json['subTotalPrice'] as num).toDouble(),
      orderStatus: json['orderStatus'] as String? ?? 'pending',
    );

Map<String, dynamic> _$CheckoutRequestModelToJson(
        CheckoutRequestModel instance) =>
    <String, dynamic>{
      'orderItems': instance.orderItems.map((e) => e.toJson()).toList(),
      'address': instance.address,
      'paymentMethod': instance.paymentMethod,
      'createdDate': instance.createdDate,
      'subTotalPrice': instance.subTotalPrice,
      'orderStatus': instance.orderStatus,
    };

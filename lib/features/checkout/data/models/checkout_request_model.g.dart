// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CheckoutRequestModelToJson(
  CheckoutRequestModel instance,
) => <String, dynamic>{
  'orderItems': instance.orderItems.map((e) => e.toJson()).toList(),
  'address': instance.address,
  'paymentMethod': instance.paymentMethod,
  'createdDate': instance.createdDate,
  'subTotalPrice': instance.subTotalPrice,
};

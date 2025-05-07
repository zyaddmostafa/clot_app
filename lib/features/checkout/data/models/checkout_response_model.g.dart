// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponseModel _$CheckoutResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutResponseModel(
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
      paymentMethod: json['paymentMethod'] as String,
      createdDate: json['createdDate'] as String,
      subTotalPrice: (json['subTotalPrice'] as num).toDouble(),
      orderStatus: json['orderStatus'] as String,
    );

Map<String, dynamic> _$CheckoutResponseModelToJson(
        CheckoutResponseModel instance) =>
    <String, dynamic>{
      'orderItems': instance.orderItems,
      'address': instance.address,
      'paymentMethod': instance.paymentMethod,
      'createdDate': instance.createdDate,
      'subTotalPrice': instance.subTotalPrice,
      'orderStatus': instance.orderStatus,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      color: json['color'] as String,
      size: json['size'] as String,
      mainPrice: json['mainPrice'] as String,
      imageUrl: json['imageUrl'] as String,
      quantity: (json['quantity'] as num).toInt(),
      totalPrice: json['totalPrice'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productTitle': instance.productTitle,
      'color': instance.color,
      'size': instance.size,
      'mainPrice': instance.mainPrice,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };

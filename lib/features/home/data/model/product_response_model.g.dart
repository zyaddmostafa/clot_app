// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductResponseModel(
  products:
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ProductResponseModelToJson(
  ProductResponseModel instance,
) => <String, dynamic>{'products': instance.products};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  category: json['category'] as String?,
  title: json['name'] as String?,
  image: json['imageUrl'] as String?,
  description: json['dec'] as String?,
  price: json['price'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.title,
      'imageUrl': instance.image,
      'dec': instance.description,
      'price': instance.price,
      'category': instance.category,
    };

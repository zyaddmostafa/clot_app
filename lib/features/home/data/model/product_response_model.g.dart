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

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  category: json['category'] as String?,
  title: json['name'] as String?,
  image: json['imageUrl'] as String?,
  description: json['dec'] as String?,
  price: json['price'] as String?,
  colorList:
      json['color'] == null
          ? null
          : ColorList.fromJson(json['color'] as List<dynamic>),
  sizeList:
      json['size'] == null
          ? null
          : SizeModel.fromJson(json['size'] as List<dynamic>),
  productId: json['categoryId'] as String?,
);

ColorItem _$ColorItemFromJson(Map<String, dynamic> json) =>
    ColorItem(name: json['name'] as String, hex: json['hex'] as String);

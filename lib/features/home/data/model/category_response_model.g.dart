// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseModel _$CategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => CategoryResponseModel(
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
  name: json['name'] as String,
  image: json['imageUrl'] as String,
);

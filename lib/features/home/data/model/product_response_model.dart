import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class ProductResponseModel extends HiveObject {
  @HiveField(0)
  final List<ProductModel> products;

  ProductResponseModel({required this.products});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @JsonKey(name: 'name')
  @HiveField(0)
  final String? title;

  @JsonKey(name: 'imageUrl')
  @HiveField(1)
  final String? image;

  @JsonKey(name: 'dec')
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? price;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  @JsonKey(name: 'color')
  final ColorList? colorList;
  @HiveField(6)
  @JsonKey(name: 'size')
  final SizeModel? sizeList;
  @JsonKey(name: 'categoryId')
  @HiveField(7)
  final String? productId;

  ProductModel({
    required this.category,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.colorList,
    required this.sizeList,
    required this.productId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 2)
class ColorItem extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String hex;

  ColorItem({required this.name, required this.hex});

  factory ColorItem.fromJson(Map<String, dynamic> json) =>
      _$ColorItemFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 3)
class ColorList extends HiveObject {
  @HiveField(0)
  final List<ColorItem> colors;

  ColorList({required this.colors});

  factory ColorList.fromJson(List<dynamic> json) {
    // Changed to expect List
    return ColorList(
      colors:
          json
              .map((e) => ColorItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 4)
class SizeModel extends HiveObject {
  @HiveField(0)
  final List<String> sizes;

  SizeModel({required this.sizes});

  // Parse from JSON array directly
  factory SizeModel.fromJson(List<dynamic> json) {
    return SizeModel(sizes: json.map((e) => e.toString()).toList());
  }
}

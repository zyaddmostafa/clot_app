import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponseModel {
  final List<ProductModel> products;

  ProductResponseModel({required this.products});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ProductModel {
  @JsonKey(name: 'name')
  final String? title;

  @JsonKey(name: 'imageUrl')
  final String? image;

  @JsonKey(name: 'dec')
  final String? description;

  final String? price;
  final String? category;

  @JsonKey(name: 'color')
  final ColorList? colorList;
  @JsonKey(name: 'size')
  final SizeModel? sizeList;
  @JsonKey(name: 'categoryId')
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
class ColorItem {
  final String name;
  final String hex;

  ColorItem({required this.name, required this.hex});

  factory ColorItem.fromJson(Map<String, dynamic> json) =>
      _$ColorItemFromJson(json);
}

@JsonSerializable()
class ColorList {
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
class SizeModel {
  final List<String> sizes;

  SizeModel({required this.sizes});

  // Parse from JSON array directly
  factory SizeModel.fromJson(List<dynamic> json) {
    return SizeModel(sizes: json.map((e) => e.toString()).toList());
  }
}

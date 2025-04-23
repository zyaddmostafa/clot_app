import 'package:json_annotation/json_annotation.dart';
part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  final List<ProductModel> products;

  ProductResponseModel({required this.products});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'imageUrl')
  final String? image;
  @JsonKey(name: 'dec')
  final String? description;
  final String? price;
  final String? category;

  ProductModel({
    required this.category,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

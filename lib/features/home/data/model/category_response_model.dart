import 'package:json_annotation/json_annotation.dart';
part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final List<CategoryItem> categories;

  CategoryResponseModel({required this.categories});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);
}

@JsonSerializable()
class CategoryItem {
  final String name;
  @JsonKey(name: 'imageUrl')
  final String image;

  CategoryItem({required this.name, required this.image});

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
}

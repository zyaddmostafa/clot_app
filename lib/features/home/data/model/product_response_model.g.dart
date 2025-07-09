// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../core/models/product_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductResponseModelAdapter extends TypeAdapter<ProductResponseModel> {
  @override
  final int typeId = 0;

  @override
  ProductResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductResponseModel(
      products: (fields[0] as List).cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      category: fields[4] as String?,
      title: fields[0] as String?,
      image: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as String?,
      colorList: fields[5] as ColorList?,
      sizeList: fields[6] as SizeModel?,
      productId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.colorList)
      ..writeByte(6)
      ..write(obj.sizeList)
      ..writeByte(7)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorItemAdapter extends TypeAdapter<ColorItem> {
  @override
  final int typeId = 2;

  @override
  ColorItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorItem(name: fields[0] as String, hex: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, ColorItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.hex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ColorListAdapter extends TypeAdapter<ColorList> {
  @override
  final int typeId = 3;

  @override
  ColorList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorList(colors: (fields[0] as List).cast<ColorItem>());
  }

  @override
  void write(BinaryWriter writer, ColorList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SizeModelAdapter extends TypeAdapter<SizeModel> {
  @override
  final int typeId = 4;

  @override
  SizeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SizeModel(sizes: (fields[0] as List).cast<String>());
  }

  @override
  void write(BinaryWriter writer, SizeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsQuantaty extends ProductDetailsState {
  final int quantity;

  ProductDetailsQuantaty({required this.quantity});
}

final class ProductDetailsSelectedColor extends ProductDetailsState {
  final int selectedColorIndex;

  ProductDetailsSelectedColor({required this.selectedColorIndex});
}

final class ProductDetailsSelectedSize extends ProductDetailsState {
  final int selectedSizeIndex;

  ProductDetailsSelectedSize({required this.selectedSizeIndex});
}

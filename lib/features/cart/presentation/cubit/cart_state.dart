part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCartloading extends CartState {}

final class AddToCartSuccess extends CartState {
  final String successMessage;

  AddToCartSuccess({required this.successMessage});
}

final class AddToCartError extends CartState {
  final String errorMessage;

  AddToCartError({required this.errorMessage});
}

final class GetCartItemsLoading extends CartState {}

final class GetCartItemsSuccess extends CartState {
  final List<CartProductResponseModel> cartItems;
  final double totalPrice;

  GetCartItemsSuccess({required this.cartItems, required this.totalPrice});
}

final class GetCartItemsError extends CartState {
  final String errorMessage;

  GetCartItemsError({required this.errorMessage});
}

final class RemoveFromCartSuccess extends CartState {
  final String successMessage;

  RemoveFromCartSuccess({required this.successMessage});
}

final class ClearCartSuccess extends CartState {
  final String successMessage;

  ClearCartSuccess({required this.successMessage});
}

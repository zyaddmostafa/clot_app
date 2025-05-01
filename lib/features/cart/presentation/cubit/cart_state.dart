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

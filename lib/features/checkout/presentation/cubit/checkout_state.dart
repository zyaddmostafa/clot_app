part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutAddOrderLoading extends CheckoutState {}

final class CheckoutAddOrderSuccess extends CheckoutState {
  final String message;

  CheckoutAddOrderSuccess(this.message);
}

final class CheckoutAddOrderError extends CheckoutState {
  final String errorMessage;

  CheckoutAddOrderError(this.errorMessage);
}

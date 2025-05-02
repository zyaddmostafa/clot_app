import 'package:bloc/bloc.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/cart/data/model/cart_product_request_model.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImpl cartRepoImpl;
  CartCubit(this.cartRepoImpl) : super(CartInitial());

  Future<void> addToCart(CartProductRequestModel addToCartModel) async {
    emit(AddToCartloading());
    try {
      final result = await cartRepoImpl.addToCart(addToCartModel);
      emit(AddToCartSuccess(successMessage: result));
    } on ErrorMessage catch (e) {
      emit(AddToCartError(errorMessage: e.message));
    }
  }

  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    try {
      final result = await cartRepoImpl.getCartItems();
      double totalPrice = calculateTotalPrice(result);
      emit(GetCartItemsSuccess(cartItems: result, totalPrice: totalPrice));
    } on ErrorMessage catch (e) {
      emit(GetCartItemsError(errorMessage: e.message));
    }
  }

  double calculateTotalPrice(List<CartProductResponseModel> cartItems) {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += double.parse(item.totalPrice);
    }
    return totalPrice;
  }

  Future<void> removeFromCart(String cartId) async {
    final result = await cartRepoImpl.removeFromCart(cartId);
    emit(RemoveFromCartSuccess(successMessage: result));
  }

  Future<void> clearCart() async {
    final result = await cartRepoImpl.clearCart();
    emit(ClearCartSuccess(successMessage: result));
  }
}

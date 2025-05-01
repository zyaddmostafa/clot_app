import 'package:bloc/bloc.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:clot_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepoImpl cartRepoImpl;
  CartCubit(this.cartRepoImpl) : super(CartInitial());

  Future<void> addToCart(AddToCartRequestModel addToCartModel) async {
    emit(AddToCartloading());
    try {
      final result = await cartRepoImpl.addToCart(addToCartModel);
      emit(AddToCartSuccess(successMessage: result));
    } on ErrorMessage catch (e) {
      emit(AddToCartError(errorMessage: e.message));
    }
  }
}

  // Future<void> getCartItems(String userId) async {
  //   emit(GetCartItemsLoading());
  //   try {
  //     final result = await cartRepoImpl.getCartItems(userId);
  //     emit(GetCartItemsSuccess(cartItems: result));
  //   } on ErrorMessage catch (e) {
  //     emit(GetCartItemsError(errorMessage: e.message));
  //   }
  // }


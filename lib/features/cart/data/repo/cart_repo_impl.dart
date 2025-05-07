import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/cart/data/model/cart_product_request_model.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:firebase_core/firebase_core.dart';

class CartRepoImpl {
  FirebaseStoreService firebaseStoreService;
  CartRepoImpl({required this.firebaseStoreService}) : super();

  Future<String> addToCart(CartProductRequestModel addToCartModel) async {
    try {
      await firebaseStoreService.addToCart(addToCartModel);
      return 'Item added to cart successfully';
    } on FirebaseException catch (e) {
      // Handle any errors that occur during the add to cart operation
      throw ErrorMessage(message: e.toString());
    }
  }

  Future<String> removeFromCart(String cartId) async {
    try {
      await firebaseStoreService.removeFromCart(cartId);
      return 'Item removed from cart successfully';
    } on FirebaseException catch (e) {
      // Handle any errors that occur during the remove from cart operation
      throw ErrorMessage(message: e.toString());
    }
  }

  Future<List<CartProductResponseModel>> getCartItems() async {
    try {
      final cartItems = await firebaseStoreService.getCartItems();
      return cartItems.map((doc) {
        return CartProductResponseModel.fromJson(doc.data(), doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      // Handle any errors that occur during the get cart items operation
      throw ErrorMessage(message: e.toString());
    }
  }

  Future<String> clearCart() async {
    try {
      await firebaseStoreService.clearCart();
      return 'All items removed from cart successfully';
    } on FirebaseException catch (e) {
      // Handle any errors that occur during the clear cart operation
      throw ErrorMessage(message: e.toString());
    }
  }
}

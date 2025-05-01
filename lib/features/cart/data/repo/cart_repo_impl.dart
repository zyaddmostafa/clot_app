import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:firebase_core/firebase_core.dart';

class CartRepoImpl {
  FirebaseStoreService firebaseStoreService;
  CartRepoImpl({required this.firebaseStoreService}) : super();

  Future<String> addToCart(AddToCartRequestModel addToCartModel) async {
    try {
      await firebaseStoreService.addToCart(addToCartModel);
      return 'Item added to cart successfully';
    } on FirebaseException catch (e) {
      // Handle any errors that occur during the add to cart operation
      throw ErrorMessage(message: e.toString());
    }
  }
}

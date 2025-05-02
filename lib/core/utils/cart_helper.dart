import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';

class CartHelper {
  static double calculateSubTotalPrice(
    List<CartProductResponseModel> cartItems,
  ) {
    double subTotal = 0.0;
    double shipping = 20.0;

    for (var item in cartItems) {
      subTotal += double.parse(item.totalPrice);
    }
    return subTotal + shipping;
  }
}

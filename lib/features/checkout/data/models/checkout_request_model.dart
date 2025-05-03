import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckoutRequestModel {
  @JsonKey(fromJson: _cartItemsFromJson)
  final List<CartProductResponseModel> orderItems;
  final String address;
  final String paymentMethod;
  final String createdDate;
  final double subTotalPrice;

  CheckoutRequestModel({
    required this.orderItems,
    required this.address,
    required this.paymentMethod,
    required this.createdDate,
    required this.subTotalPrice,
  });

  // Custom converter for the list of CartProductResponseModel
  static List<CartProductResponseModel> _cartItemsFromJson(List<dynamic> json) {
    return json
        .map(
          (item) => CartProductResponseModel.fromJson(
            item as Map<String, dynamic>,
            '',
          ),
        )
        .toList();
  }

  // From your existing code - keep this
  Map<String, dynamic> toJson() => _$CheckoutRequestModelToJson(this);
}

import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/checkout/data/models/checkout_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutRepoImpl {
  final FirebaseStoreService firebaseStoreService;
  CheckoutRepoImpl({required this.firebaseStoreService});

  Future<void> addOrder(CheckoutRequestModel checkoutRequestModel) async {
    try {
      await firebaseStoreService.addOrder(checkoutRequestModel);
      await firebaseStoreService.clearCart();
    } on FirebaseException catch (e) {
      throw ErrorMessage(
        message: e.message ?? 'An error occurred while adding order.',
      );
    }
  }
}

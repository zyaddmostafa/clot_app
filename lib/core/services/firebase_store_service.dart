import 'package:clot_app/core/apis_helpers/api_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Adds user data to Firestore.
  Future<void> addUserData(String userId, Map<String, dynamic> userData) async {
    if (userId.isEmpty) {
      await firestore
          .collection(ApiConstants.userCollection)
          .doc(userId)
          .set(userData);
    } else {
      await firestore.collection(ApiConstants.userCollection).add(userData);
    }
  }
}

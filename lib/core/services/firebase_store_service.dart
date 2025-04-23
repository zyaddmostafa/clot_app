import 'package:clot_app/core/apis_helpers/api_constants.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
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

  // Featch Categories from Firestore
  Future<CategoryResponseModel> getCategories() async {
    QuerySnapshot snapshot =
        await firestore.collection(ApiConstants.categoriesCollection).get();
    // the result is a list of documents form the collection
    // and we need to convert it to a list of CategoryItem objects first
    // and then we will return the CategoryResponseModel object
    final result =
        snapshot.docs.map((doc) {
          return CategoryItem.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
    return CategoryResponseModel(categories: result);
  }
}

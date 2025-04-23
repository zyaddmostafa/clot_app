import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeRepoImpl {
  final FirebaseStoreService firebaseStoreService;
  HomeRepoImpl({required this.firebaseStoreService});

  /// Fetches categories from Firestore.
  Future<CategoryResponseModel> getCategories() async {
    try {
      return await firebaseStoreService.getCategories();
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: ${e.code} - ${e.message}');
      throw ErrorMessage(message: e.toString());
    }
  }

  Future<ProductResponseModel> getProduct() async {
    try {
      return await firebaseStoreService.getProduct();
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: ${e.code} - ${e.message}');
      throw ErrorMessage(message: e.toString());
    }
  }
}

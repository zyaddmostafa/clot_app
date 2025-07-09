import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchRepoImpl {
  final FirebaseStoreService _firebaseStoreService;
  SearchRepoImpl({required FirebaseStoreService firebaseStoreService})
    : _firebaseStoreService = firebaseStoreService;

  /// Fetches search results from Firestore.
  Future<ProductResponseModel> getSortedProduct(
    bool query,
    String sortBy,
  ) async {
    try {
      final getSortedProduct = await _firebaseStoreService.getSortedProduct(
        query,
        sortBy,
      );
      return getSortedProduct;
    } on FirebaseException catch (e) {
      debugPrint(
        'getSortedProduct in SearchRepoImpl error: ${e.code} - ${e.message}',
      );
      throw ErrorMessage(message: e.toString());
    }
  }

  /// Fetches search results from Firestore based on a matching query.
  Future<ProductResponseModel> searchProductsByName(String productName) async {
    try {
      final searchResults = await _firebaseStoreService.searchProductsByName(
        productName.trim(),
      );
      return searchResults;
    } on FirebaseException catch (e) {
      debugPrint(
        'searchProductsByName in SearchRepoImpl error: ${e.code} - ${e.message}',
      );
      throw ErrorMessage(message: e.toString());
    }
  }
}

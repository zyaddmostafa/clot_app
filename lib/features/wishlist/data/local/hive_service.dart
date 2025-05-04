import 'dart:developer';

import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static const String wishlistBoxName = 'wishlistProductbox';
  final Box<ProductModel> _wishlistBox = Hive.box(wishlistBoxName);

  // Initialize Hive and register adapters
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register all adapters
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ProductResponseModelAdapter());
    Hive.registerAdapter(ColorListAdapter());
    Hive.registerAdapter(SizeModelAdapter());
    Hive.registerAdapter(ColorItemAdapter());
    await Hive.openBox<ProductModel>(wishlistBoxName);
  }

  // Add product to wishlist
  Future<void> addToWishlist(ProductModel product) async {
    try {
      final productId = product.productId.toString();
      await _wishlistBox.put(productId, product);
    } catch (e) {
      log('Error adding product to wishlist: $e');
      throw Exception('Failed to add product to wishlist: $e');
    }
  }

  // Remove product from wishlist
  Future<void> removeFromWishlist(ProductModel product) async {
    try {
      await _wishlistBox.delete(product.productId);
    } catch (e) {
      log('Error removing product from wishlist: $e');
      throw Exception('Failed to remove product from wishlist: $e');
    }
  }

  // Get all wishlist products
  List<ProductModel> getWishlistProducts() {
    try {
      return _wishlistBox.values.toList();
    } catch (e) {
      log('Error getting wishlist products: $e');
      return [];
    }
  }

  // Check if product is in wishlist
  bool isInWishlist(String productId) {
    try {
      return _wishlistBox.containsKey(productId);
    } catch (e) {
      debugPrint('Error checking if product is in wishlist: $e');
      return false;
    }
  }

  // Close the box when done
  Future<void> closeBox() async {
    await _wishlistBox.close();
  }
}

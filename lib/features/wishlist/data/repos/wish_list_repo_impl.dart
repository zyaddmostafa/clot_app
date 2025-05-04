import 'package:clot_app/features/wishlist/data/local/hive_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';

class WishListRepoImpl {
  final HiveService _hiveService;
  final List<ProductModel> _cachedWishList = [];

  // Inject HiveService through constructor
  WishListRepoImpl({required HiveService hiveService})
    : _hiveService = hiveService {
    // Initialize the cache from Hive storage
    _loadFromStorage();
  }

  // Private method to load wishlist from storage to memory cache
  Future<void> _loadFromStorage() async {
    try {
      _cachedWishList.clear();
      _cachedWishList.addAll(_hiveService.getWishlistProducts());
    } catch (e) {
      throw ErrorMessage(message: 'Failed to load wishlist from storage: $e');
    }
  }

  // Add to wishlist (both in-memory and persistent storage)
  Future<void> addToWishlist(ProductModel productModel) async {
    try {
      // Only add if not already in wishlist
      if (!isInWishlist(productModel)) {
        // Add to persistent storage
        await _hiveService.addToWishlist(productModel);

        // Add to in-memory cache
        _cachedWishList.add(productModel);
      }
    } catch (e) {
      throw ErrorMessage(
        message:
            'An error occurred while adding the product to the wishlist: $e',
      );
    }
  }

  // Check if product is in wishlist (using in-memory cache for faster lookup)
  bool isInWishlist(ProductModel productModel) {
    // Check in-memory cache first for performance
    if (_cachedWishList.isNotEmpty) {
      for (var product in _cachedWishList) {
        if (product.productId == productModel.productId) {
          return true;
        }
      }
    }

    // Double check with Hive if not found in cache
    return _hiveService.isInWishlist(productModel.productId!);
  }

  // Remove from wishlist (both in-memory and persistent storage)
  Future<void> removeFromWishlist(ProductModel productModel) async {
    try {
      // Remove from persistent storage
      await _hiveService.removeFromWishlist(productModel);

      // Remove from in-memory cache
      _cachedWishList.removeWhere(
        (product) => product.productId == productModel.productId,
      );
    } catch (e) {
      throw ErrorMessage(
        message:
            'An error occurred while removing the product from the wishlist: $e',
      );
    }
  }

  // Get full wishlist (from in-memory cache for better performance)
  List<ProductModel> getWishlist() {
    return List.unmodifiable(_cachedWishList);
  }

  // Refresh the wishlist from storage (useful after app restart)
  Future<List<ProductModel>> refreshWishlist() async {
    await _loadFromStorage();
    return getWishlist();
  }

  // Clear entire wishlist
  // Future<void> clearWishlist() async {
  //   try {
  //     // Clear all products from the Hive box
  //     for (var product in _cachedWishList) {
  //       await _hiveService.removeFromWishlist(product);
  //     }

  //     // Clear in-memory cache
  //     _cachedWishList.clear();
  //   } catch (e) {
  //     throw ErrorMessage(
  //       message: 'An error occurred while clearing the wishlist: $e',
  //     );
  //   }
  // }
}

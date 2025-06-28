import 'package:bloc/bloc.dart';
import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/features/wishlist/data/repos/wish_list_repo_impl.dart';

import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  final WishListRepoImpl wishListRepoImpl;

  WishListCubit(this.wishListRepoImpl) : super(WishListInitial());

  Future<void> loadWishlist() async {
    try {
      emit(WishListLoading());
      final products = await wishListRepoImpl.refreshWishlist();
      emit(WishListLoad(wishList: products));
      if (products.isEmpty) {
        emit(
          WishListEmpty(
            message: 'Your wishlist is empty. Add some products to it!',
          ),
        );
      }
    } catch (e) {
      emit(WishListError(message: e.toString()));
    }
  }

  Future<void> addToWishlist(ProductModel product) async {
    try {
      await wishListRepoImpl.addToWishlist(product);
      emit(WishListAdded(message: '${product.title} added to wishlist'));
      emit(WishListLoad(wishList: wishListRepoImpl.getWishlist()));
    } catch (e) {
      emit(WishListError(message: e.toString()));
    }
  }

  Future<void> removeFromWishlist(ProductModel product) async {
    try {
      await wishListRepoImpl.removeFromWishlist(product);
      emit(WishListRemoved(message: '${product.title} removed from wishlist'));
      emit(WishListLoad(wishList: wishListRepoImpl.getWishlist()));
      if (wishListRepoImpl.getWishlist().isEmpty) {
        emit(
          WishListEmpty(
            message: 'Your wishlist is empty. Add some products to it!',
          ),
        );
      }
    } catch (e) {
      emit(WishListError(message: e.toString()));
    }
  }

  bool isInWishlist(ProductModel product) {
    return wishListRepoImpl.isInWishlist(product);
  }

  void getWishlist() {
    emit(WishListLoad(wishList: wishListRepoImpl.getWishlist()));
    if (wishListRepoImpl.getWishlist().isEmpty) {
      emit(
        WishListEmpty(
          message: 'Your wishlist is empty. Add some products to it!',
        ),
      );
    }
  }

  void isWishlistEmpty() {
    emit(
      WishListEmpty(
        message: 'Your wishlist is empty. Add some products to it!',
      ),
    );
  }
}

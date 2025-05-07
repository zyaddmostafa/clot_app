part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class WishListLoading extends WishListState {}

final class WishListLoad extends WishListState {
  final List<ProductModel> wishList;
  WishListLoad({required this.wishList});
}

final class WishListError extends WishListState {
  final String message;
  WishListError({required this.message});
}

final class WishListAdded extends WishListState {
  final String message;
  WishListAdded({required this.message});
}

final class WishListRemoved extends WishListState {
  final String message;
  WishListRemoved({required this.message});
}

final class WishListEmpty extends WishListState {
  final String message;
  WishListEmpty({required this.message});
}

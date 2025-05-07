part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCategoryLoading extends HomeState {}

final class HomeCategorySuccess extends HomeState {
  final List<CategoryItem> categories;
  HomeCategorySuccess({required this.categories});
}

final class HomeCategoryError extends HomeState {
  final String errorMessage;

  HomeCategoryError({required this.errorMessage});
}

final class HomeProductLoading extends HomeState {}

final class HomeProductSuccess extends HomeState {
  final List<ProductModel> products;
  HomeProductSuccess({required this.products});
}

final class HomeProductError extends HomeState {
  final String errorMessage;

  HomeProductError({required this.errorMessage});
}

final class HomeFilterProductLoading extends HomeState {}

final class HomeFilterProductSuccess extends HomeState {
  final List<ProductModel> products;
  HomeFilterProductSuccess({required this.products});
}

final class HomeFilterProductError extends HomeState {
  final String errorMessage;

  HomeFilterProductError({required this.errorMessage});
}

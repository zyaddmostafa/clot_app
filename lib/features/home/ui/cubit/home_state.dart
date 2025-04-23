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

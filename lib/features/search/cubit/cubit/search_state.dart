part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ProductModel> searchResults;

  SearchSuccess({required this.searchResults});
}

final class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}

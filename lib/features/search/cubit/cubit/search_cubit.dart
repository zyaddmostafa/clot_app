import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/features/search/data/repo/search_repo_impl.dart';
import 'package:flutter/widgets.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepoImpl searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  void getSortedProduct(bool query, String sortBy) async {
    emit(SearchLoading());
    try {
      final sortedProduct = await searchRepo.getSortedProduct(query, sortBy);
      emit(SearchSuccess(searchResults: sortedProduct.products));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }

  void searchProducts(String query) async {
    // Cancel previous timer if it exists
    _debounceTimer?.cancel();

    // If query is empty, clear search
    if (query.trim().isEmpty) {
      clearSearch();
      return;
    }

    // Set a new timer for debouncing
    _debounceTimer = Timer(const Duration(milliseconds: 100), () async {
      emit(SearchLoading());
      try {
        final searchResults = await searchRepo.searchProductsByName(query);
        log(
          'Search results: ${searchResults.products.isNotEmpty ? searchResults.products[0].title : "No results"}',
        );
        emit(SearchSuccess(searchResults: searchResults.products));
      } catch (e) {
        emit(SearchError(message: e.toString()));
      }
    });
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    searchController.dispose();
    return super.close();
  }
}

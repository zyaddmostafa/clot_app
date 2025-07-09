import 'package:clot_app/features/search/cubit/cubit/search_cubit.dart';
import 'package:clot_app/features/search/presentation/widgets/no_result_search_widget.dart';
import 'package:clot_app/features/search/presentation/widgets/search_result_shimmer_widget.dart';
import 'package:clot_app/features/search/presentation/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenBlocBuilder extends StatelessWidget {
  const SearchScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const SearchResultShimmerWidget();
          } else if (state is SearchSuccess) {
            if (state.searchResults.isEmpty) {
              return const NoResultSearchWidget();
            }
            return Expanded(
              child: SearchResultWidget(products: state.searchResults),
            );
          } else {
            return const NoResultSearchWidget();
          }
        },
      ),
    );
  }
}

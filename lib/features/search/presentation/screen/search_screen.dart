import 'package:clot_app/features/search/cubit/cubit/search_cubit.dart';
import 'package:clot_app/features/search/presentation/widgets/search_screen_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:clot_app/core/widgets/search_textfiled.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchCubit>().searchController;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top search bar with search button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SearchTextfiled(
                      controller: searchController,
                      hintText: "Search products by name...",
                      onChanged: (value) {
                        // Debounced search - triggers automatically after 500ms
                        context.read<SearchCubit>().searchProducts(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Clear button
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      searchController.clear();
                      context.read<SearchCubit>().clearSearch();
                    },
                  ),
                ],
              ),
            ),
            const SearchScreenBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
